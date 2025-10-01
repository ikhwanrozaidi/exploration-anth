import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
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
  final Map<String, List<GalleryImage>>? initialTabImages;
  final bool inputProgress;
  final bool workerPicture;
  final bool pinPointFirst;
  final int maxImages;
  final int? minimumImage;
  final bool tabLock;
  final Function(GalleryResult)? onImagesChanged;
  final VoidCallback? onDialogConfirm;

  const GalleryWidget({
    super.key,
    required this.title,
    this.isGallery = false,
    this.pictures,
    this.initialTabImages,
    this.inputProgress = false,
    this.workerPicture = false,
    this.pinPointFirst = false,
    this.maxImages = 10,
    this.minimumImage,
    this.tabLock = true,
    this.onImagesChanged,
    this.onDialogConfirm,
  });

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget>
    with SingleTickerProviderStateMixin {
  final CameraService _cameraService = CameraService();

  final List<GalleryImage> _images = [];
  final Map<String, List<GalleryImage>> _tabImages = {
    'before': [],
    'current': [],
    'after': [],
  };

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

    if (widget.tabLock &&
        widget.minimumImage != null &&
        _currentTab == 'before' &&
        newTab != 'before' &&
        !_beforeTabConfirmed) {
      if (currentImages.length >= widget.minimumImage!) {
        final shouldContinue = await TabLockDialog.show(context, newTab);

        if (shouldContinue == true) {
          setState(() {
            _beforeTabConfirmed = true;
            _currentTab = newTab;
          });
        } else {
          _tabController!.animateTo(
            ['before', 'current', 'after'].indexOf(_currentTab),
          );
        }
      } else {
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
        _tabController!.animateTo(
          ['before', 'current', 'after'].indexOf(_currentTab),
        );
      }
    } else {
      setState(() {
        _currentTab = newTab;

        if (newTab == 'before') {
          _beforeTabConfirmed = false;
        }
      });
    }
  }

  void _initializeImages() {
    if (widget.inputProgress && widget.initialTabImages != null) {
      widget.initialTabImages!.forEach((tab, images) {
        _tabImages[tab] = List<GalleryImage>.from(images);
      });

      if (widget.minimumImage != null) {
        final beforeCount = _tabImages['before']?.length ?? 0;
        if (beforeCount >= widget.minimumImage!) {
          _beforeTabConfirmed = true;
          print('✅ Before tab confirmed (has $beforeCount images)');
        }
      }
      return;
    }

    if (widget.pictures != null && widget.pictures!.isNotEmpty) {
      if (widget.workerPicture) {
        _workerImage = GalleryImage(
          path: widget.pictures!.first,
          capturedAt: DateTime.now(),
        );
      } else if (widget.inputProgress) {
        _tabImages[_currentTab]!.addAll(
          widget.pictures!.map((path) {
            return GalleryImage(
              path: path,
              capturedAt: DateTime.now(),
              type: _currentTab,
            );
          }),
        );
      } else {
        _images.addAll(
          widget.pictures!.map((path) {
            return GalleryImage(path: path, capturedAt: DateTime.now());
          }),
        );
      }
    } else {
      print('⚠️ No images to initialize');
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
    if (_isCameraLoading) return;

    final currentImages = _tabImages[_currentTab]!;
    if (currentImages.length >= widget.maxImages) {
      _showMaxImagesDialog();
      return;
    }

    try {
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
    if (_isCameraLoading) return;

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
        final confirmed = await ImagePreviewDialog.show(context, image);

        if (confirmed == true) {
          if (widget.onDialogConfirm != null) {
            widget.onDialogConfirm!();
          }

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
        widget.onImagesChanged!(
          GalleryResult(images: [], tabImages: Map.from(_tabImages)),
        );
      } else if (widget.workerPicture) {
        widget.onImagesChanged!(
          GalleryResult(images: _workerImage != null ? [_workerImage!] : []),
        );
      } else {
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

  void _returnImagesAndPop() {
    if (widget.inputProgress) {
      _tabImages.forEach((tab, images) {});

      Navigator.of(
        context,
      ).pop(GalleryResult(images: [], tabImages: Map.from(_tabImages)));
    } else if (widget.workerPicture) {
      Navigator.of(
        context,
      ).pop(GalleryResult(images: _workerImage != null ? [_workerImage!] : []));
    } else {
      Navigator.of(context).pop(GalleryResult(images: List.from(_images)));
    }
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
                _returnImagesAndPop();
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
          children: [
            SizedBox(width: 15),
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

      floatingActionButton: widget.workerPicture
          ? null
          : CameraButton(
              onPressed: () async {
                if (widget.workerPicture) {
                  await _captureWorkerImage();
                } else if (widget.inputProgress) {
                  await _captureTabImage();
                } else {
                  await _captureNormalImage();
                }
              },
              imageCount: currentImageCount,
              minimumImage: widget.minimumImage,
              isLoading: _isCameraLoading,
            ),
    );
  }

  Widget _buildWorkerPictureView() {
    if (_workerImage == null) {
      return Center(
        child: Column(
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              dashPattern: const [6, 3],
              color: Colors.grey,
              strokeWidth: 1.5,
              child: GestureDetector(
                onTap: () {
                  _captureWorkerImage();
                },
                child: Container(
                  height: ResponsiveHelper.getHeight(context, 0.25),
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/icons/capture_workers.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      const Text(
                        "Click here to take photo of worker",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Center(
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            dashPattern: const [6, 3],
            color: Colors.grey,
            strokeWidth: 1.5,
            child: GestureDetector(
              onTap: () {
                _captureWorkerImage();
              },
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File(_workerImage!.path),
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Left
                    Positioned(
                      top: 10,
                      left: 10,
                      child: GestureDetector(
                        onTap: _deleteWorkerImage,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // Right
                    Positioned(
                      top: 15,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: primaryColor, width: 1),
                        ),
                        child: Text(
                          'No Workers',
                          style: TextStyle(color: primaryColor, fontSize: 12),
                        ),
                      ),
                    ),

                    // Bottom
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: _captureWorkerImage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: primaryColor,
                              width: ResponsiveHelper.adaptive(
                                context,
                                mobile: 1.0,
                                tablet: 1.5,
                                desktop: 2.0,
                              ),
                            ),
                            padding: ResponsiveHelper.padding(
                              context,
                              vertical: 5,
                              horizontal: 25,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: ResponsiveHelper.borderRadius(
                                context,
                                all: 10,
                              ),
                            ),
                          ),
                          child: Text('Retake', style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Spacer(),

        _workerImage == null
            ? SizedBox()
            : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _returnImagesAndPop();
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
                  child: Text('Add', style: TextStyle(color: Colors.white)),
                ),
              ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildNormalView() {
    final bool showEmptyState = !widget.isGallery && _images.isEmpty;

    return showEmptyState
        ? Center(child: const EmptyGalleryState())
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
