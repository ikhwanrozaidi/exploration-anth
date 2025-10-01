import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../utils/responsive_helper.dart';
import '../../../utils/theme.dart';
import '../models/gallery_image.dart';

class ImagePreviewDialog extends StatelessWidget {
  final GalleryImage image;
  final VoidCallback? onConfirm;

  const ImagePreviewDialog({super.key, required this.image, this.onConfirm});

  static Future<bool?> show(BuildContext context, GalleryImage image) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => ImagePreviewDialog(
        image: image,
        onConfirm: () => Navigator.of(context).pop(true),
      ),
    );
  }

  static Future<void> showWithCallbacks({
    required BuildContext context,
    required GalleryImage image,
    VoidCallback? onConfirm,
    VoidCallback? onRetake,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => ImagePreviewDialog(
        image: image,
        onConfirm: onConfirm ?? () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        color: Colors.grey.shade800.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),

                child: InteractiveViewer(
                  child: Image.file(File(image.path), fit: BoxFit.contain),
                ),
              ),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
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
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: ResponsiveHelper.borderRadius(
                            context,
                            all: 14,
                          ),
                        ),
                      ),
                      child: Text(
                        'Retake',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.spacing(context, 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: ResponsiveHelper.spacing(context, 4)),
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                          onConfirm ?? () => Navigator.of(context).pop(true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        disabledBackgroundColor: Colors.grey[300],
                        padding: ResponsiveHelper.padding(
                          context,
                          vertical: 15,
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
                        'Confirm',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ResponsiveHelper.spacing(context, 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
