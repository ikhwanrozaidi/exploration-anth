import 'dart:io';

import 'package:flutter/material.dart';

import '../../utils/responsive_helper.dart';
import '../../utils/theme.dart';
import 'models/gallery_image.dart';
import 'models/gallery_result.dart';
import 'service/camera_service.dart';
import 'service/permission_service.dart';
import 'widgets/empty_gallery_state.dart';
import 'widgets/image_grid_view.dart';
import 'widgets/camera_button.dart';
import 'widgets/image_preview_dialog.dart';
import 'widgets/tab_lock_dialog.dart';

class GalleryWidget extends StatefulWidget {
  final String title;
  final bool isGallery;
  final List<String>? pictures;
  final bool inputProgress;
  final bool workerPicture;
  final bool pinPointFirst;
  final int maxImages;
  final int? minimumImage;
  final bool tabLock;
  final Function(GalleryResult)? onImagesChanged;

  const GalleryWidget({
    super.key,
    required this.title,
    this.isGallery = false,
    this.pictures,
    this.inputProgress = false,
    this.workerPicture = false,
    this.pinPointFirst = false,
    this.maxImages = 10,
    this.minimumImage,
    this.tabLock = true,
    this.onImagesChanged,
  });

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget>
    with SingleTickerProviderStateMixin {
  final CameraService _cameraService = CameraService();

  // Normal Gallery mode
  final List<GalleryImage> _images = [];

  // inputProgress mode (tabs)
  final Map<String, List<GalleryImage>> _tabImages = {
    'before': [],
    'current': [],
    'after': [],
  };

  // workerPicture mode
  GalleryImage? _workerImage;
  TabController? _tabController;
  String _currentTab = 'before';

  bool _beforeTabConfirmed = false;
  bool _isCameraLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeMode();
    _initializeImages();
  }

  void _initializeMode() {
    if (widget.inputProgress) {
      _tabController = TabController(length: 3, vsync: this);
      _tabController!.addListener(() {
        if (!_tabController!.indexIsChanging) {
          _handleTabChange(_tabController!.index);
        }
      });
    }
  }

  Future<void> _handleTabChange(int newIndex) async {
    final newTab = ['before', 'current', 'after'][newIndex];
    final currentImages = _tabImages[_currentTab]!;

    // Check if tab lock is enabled and minimum image requirement
    if (widget.tabLock &&
        widget.minimumImage != null &&
        _currentTab == 'before' &&
        newTab != 'before' &&
        !_beforeTabConfirmed) {
      // Check if minimum images met
      if (currentImages.length >= widget.minimumImage!) {
        // Show confirmation dialog
        final shouldContinue = await TabLockDialog.show(context, newTab);

        if (shouldContinue == true) {
          setState(() {
            _beforeTabConfirmed = true;
            _currentTab = newTab;
          });
        } else {
          // User wants to retake, stay on current tab
          _tabController!.animateTo(
            ['before', 'current', 'after'].indexOf(_currentTab),
          );
        }
      } else {
        // Not enough images, show error
        _showMinimumImagesDialog();
        _tabController!.animateTo(
          ['before', 'current', 'after'].indexOf(_currentTab),
        );
      }
    } else {
      // No lock, just switch
      setState(() {
        _currentTab = newTab;

        // Reset confirmation if user goes back to 'before' tab
        if (newTab == 'before') {
          _beforeTabConfirmed = false;
        }
      });
    }
  }

  void _showMinimumImagesDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Minimum Images Required'),
        content: Text(
          'Please add at least ${widget.minimumImage} images before proceeding to the next tab.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _initializeImages() {
    if (widget.pictures != null && widget.pictures!.isNotEmpty) {
      if (widget.inputProgress) {
        // For tabs mode, distribute images if needed
        // For now, just add to current tab
        _tabImages[_currentTab]!.addAll(
          widget.pictures!.map(
            (path) => GalleryImage(
              path: path,
              capturedAt: DateTime.now(),
              type: _currentTab,
            ),
          ),
        );
      } else if (widget.workerPicture) {
        // For worker picture, only take first image
        _workerImage = GalleryImage(
          path: widget.pictures!.first,
          capturedAt: DateTime.now(),
        );
      } else {
        // Normal gallery mode
        _images.addAll(
          widget.pictures!.map(
            (path) => GalleryImage(path: path, capturedAt: DateTime.now()),
          ),
        );
      }
    }
  }

  Future<void> _captureImage() async {
    if (widget.workerPicture) {
      await _captureWorkerImage();
    } else if (widget.inputProgress) {
      await _captureTabImage();
    } else {
      await _captureNormalImage();
    }
  }

  Future<void> _captureNormalImage() async {
    if (_isCameraLoading) return;

    if (_images.length >= widget.maxImages) {
      _showMaxImagesDialog();
      return;
    }

    setState(() {
      _isCameraLoading = true;
    });

    try {
      final image = await _cameraService.captureImage(
        pinPointFirst: widget.pinPointFirst,
      );

      setState(() {
        _isCameraLoading = false;
      });

      if (image != null) {
        // final confirmed = await ImagePreviewDialog.show(context, image);
        final confirmed = true;
        if (confirmed == true) {
          setState(() {
            _images.add(image);
          });
          _notifyParent();
        } else {
          await _cameraService.deleteImage(image.path);
          await _captureNormalImage();
        }
      }
    } catch (e) {
      setState(() {
        _isCameraLoading = false;
      });
      _showErrorDialog('Failed to capture image: $e');
    }
  }

  Future<void> _captureTabImage() async {
    if (_isCameraLoading) return; // Prevent multiple calls

    final currentImages = _tabImages[_currentTab]!;
    if (currentImages.length >= widget.maxImages) {
      _showMaxImagesDialog();
      return;
    }

    try {
      // Show bottom sheet to choose camera or gallery
      final allowGallery = _currentTab != 'before';

      final source = await _showImageSourceDialog(allowGallery);
      if (source == null) return;

      setState(() {
        _isCameraLoading = true;
      });

      GalleryImage? image;
      if (source == ImageSource.camera) {
        image = await _cameraService.captureImage(
          pinPointFirst: widget.pinPointFirst,
          imageType: _currentTab,
        );
      } else {
        image = await _cameraService.pickFromGallery(
          pinPointFirst: widget.pinPointFirst,
          imageType: _currentTab,
        );
      }

      setState(() {
        _isCameraLoading = false;
      });

      if (image != null) {
        // final confirmed = await ImagePreviewDialog.show(context, image);
        final confirmed = true;
        if (confirmed == true) {
          setState(() {
            _tabImages[_currentTab]!.add(image!);
          });
          _notifyParent();
        } else {
          await _cameraService.deleteImage(image.path);
          await _captureTabImage();
        }
      }
    } catch (e) {
      setState(() {
        _isCameraLoading = false;
      });
      _showErrorDialog('Failed to capture image: $e');
    }
  }

  Future<void> _captureWorkerImage() async {
    if (_isCameraLoading) return; // Prevent multiple calls

    setState(() {
      _isCameraLoading = true;
    });

    try {
      final image = await _cameraService.captureImage(
        pinPointFirst: widget.pinPointFirst,
      );

      setState(() {
        _isCameraLoading = false;
      });

      if (image != null) {
        // final confirmed = await ImagePreviewDialog.show(context, image);
        final confirmed = true;
        if (confirmed == true) {
          // Delete old worker image if exists
          if (_workerImage != null) {
            await _cameraService.deleteImage(_workerImage!.path);
          }
          setState(() {
            _workerImage = image;
          });
          _notifyParent();
        } else {
          await _cameraService.deleteImage(image.path);
          await _captureWorkerImage();
        }
      }
    } catch (e) {
      setState(() {
        _isCameraLoading = false;
      });
      _showErrorDialog('Failed to capture image: $e');
    }
  }

  Future<ImageSource?> _showImageSourceDialog(bool allowGallery) async {
    if (!allowGallery) {
      return ImageSource.camera;
    }

    return showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteImage(int index) async {
    final confirmed = await _showDeleteConfirmation();
    if (confirmed == true) {
      if (widget.inputProgress) {
        final image = _tabImages[_currentTab]![index];
        await _cameraService.deleteImage(image.path);
        setState(() {
          _tabImages[_currentTab]!.removeAt(index);
        });
      } else {
        final image = _images[index];
        await _cameraService.deleteImage(image.path);
        setState(() {
          _images.removeAt(index);
        });
      }
      _notifyParent();
    }
  }

  Future<void> _deleteWorkerImage() async {
    final confirmed = await _showDeleteConfirmation();
    if (confirmed == true && _workerImage != null) {
      await _cameraService.deleteImage(_workerImage!.path);
      setState(() {
        _workerImage = null;
      });
      _notifyParent();
    }
  }

  void _notifyParent() {
    if (widget.onImagesChanged != null) {
      if (widget.inputProgress) {
        // Return tab images
        widget.onImagesChanged!(
          GalleryResult(images: [], tabImages: Map.from(_tabImages)),
        );
      } else if (widget.workerPicture) {
        // Return worker image
        widget.onImagesChanged!(
          GalleryResult(images: _workerImage != null ? [_workerImage!] : []),
        );
      } else {
        // Return normal images
        widget.onImagesChanged!(GalleryResult(images: List.from(_images)));
      }
    }
  }

  Future<bool?> _showDeleteConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Image'),
        content: const Text('Are you sure you want to delete this image?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showMaxImagesDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Maximum Images Reached'),
        content: Text('You can only add up to ${widget.maxImages} images.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    final bool isPermissionError = message.contains('permission');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          if (isPermissionError)
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await PermissionService.openAppSettings();
              },
              child: const Text('Open Settings'),
            ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(isPermissionError ? 'Cancel' : 'OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int currentImageCount = 0;
    if (widget.inputProgress) {
      currentImageCount = _tabImages[_currentTab]?.length ?? 0;
    } else if (widget.workerPicture) {
      currentImageCount = _workerImage != null ? 1 : 0;
    } else {
      currentImageCount = _images.length;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(-2, 6),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),

            SizedBox(width: ResponsiveHelper.spacing(context, 15)),

            Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: ResponsiveHelper.spacing(context, 15)),
            Expanded(
              child: widget.workerPicture
                  ? _buildWorkerPictureView()
                  : widget.inputProgress
                  ? _buildTabView()
                  : _buildNormalView(),
            ),
          ],
        ),
      ),
      floatingActionButton: CameraButton(
        onPressed: _captureImage,
        imageCount: currentImageCount,
        minimumImage: widget.minimumImage,
        isLoading: _isCameraLoading,
      ),
    );
  }

  Widget _buildWorkerPictureView() {
    if (_workerImage == null) {
      return const EmptyGalleryState();
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(_workerImage!.path),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: _deleteWorkerImage,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, size: 10, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNormalView() {
    final bool showEmptyState = !widget.isGallery && _images.isEmpty;

    return showEmptyState
        ? const EmptyGalleryState()
        : ImageGridView(images: _images, onDeleteImage: _deleteImage);
  }

  Widget _buildTabView() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            labelColor: Colors.black,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              fontSize: ResponsiveHelper.spacing(context, 14),
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelColor: Colors.grey[600],
            unselectedLabelStyle: TextStyle(
              fontSize: ResponsiveHelper.spacing(context, 14),
              fontWeight: FontWeight.normal,
            ),
            tabs: const [
              Tab(text: 'Before'),
              Tab(text: 'Current'),
              Tab(text: 'After'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildTabContent('before'),
              _buildTabContent('current'),
              _buildTabContent('after'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabContent(String tabType) {
    final images = _tabImages[tabType]!;

    if (images.isEmpty) {
      return const EmptyGalleryState();
    }

    final shouldShowAddButton =
        widget.tabLock &&
        widget.minimumImage != null &&
        tabType == 'before' &&
        images.length >= widget.minimumImage!;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 20),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: ResponsiveHelper.spacing(context, 1.5),
              mainAxisSpacing: ResponsiveHelper.spacing(context, 1.5),
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return ImageItem(
                image: images[index],
                onDelete: () => _deleteImage(index),
              );
            }, childCount: images.length),
          ),
        ),
        if (shouldShowAddButton)
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveHelper.spacing(context, 2),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (!_beforeTabConfirmed) {
                          final shouldContinue = await TabLockDialog.show(
                            context,
                            'current',
                          );
                          if (shouldContinue == true && mounted) {
                            setState(() {
                              _beforeTabConfirmed = true;
                            });
                            _tabController!.animateTo(1);
                          }
                        } else {
                          _tabController!.animateTo(1);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        disabledBackgroundColor: Colors.grey[300],
                        padding: ResponsiveHelper.padding(
                          context,
                          vertical: 10,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: ResponsiveHelper.borderRadius(
                            context,
                            all: 14,
                          ),
                        ),
                        elevation: ResponsiveHelper.adaptive(
                          context,
                          mobile: 1,
                          tablet: 2,
                          desktop: 3,
                        ),
                      ),
                      child: Text(
                        'Add',
                        style: TextStyle(
                          // fontSize: fontSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: ResponsiveHelper.spacing(context, 2)),
              ],
            ),
          ),
      ],
    );
  }
}

enum ImageSource { camera, gallery }
