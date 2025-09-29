import 'dart:io';
import 'package:flutter/material.dart';

import '../../../utils/responsive_helper.dart';
import '../models/gallery_image.dart';

// ---Not in use for now
class ImagePreviewDialog extends StatelessWidget {
  final GalleryImage image;

  const ImagePreviewDialog({super.key, required this.image});

  static Future<bool?> show(BuildContext context, GalleryImage image) {
    return showDialog<bool>(
      context: context,
      builder: (context) => ImagePreviewDialog(image: image),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: InteractiveViewer(
              child: Image.file(File(image.path), fit: BoxFit.contain),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(ResponsiveHelper.spacing(context, 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        vertical: ResponsiveHelper.spacing(context, 1.5),
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
                    onPressed: () => Navigator.of(context).pop(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3A8A),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: ResponsiveHelper.spacing(context, 1.5),
                      ),
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.spacing(context, 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
