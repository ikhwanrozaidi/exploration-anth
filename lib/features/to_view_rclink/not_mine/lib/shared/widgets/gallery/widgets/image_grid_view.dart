import 'dart:io';

import 'package:flutter/material.dart';
import '../../../utils/responsive_helper.dart';
import '../models/gallery_image.dart';

class ImageGridView extends StatelessWidget {
  final List<GalleryImage> images;
  final Function(int) onDeleteImage;

  const ImageGridView({
    super.key,
    required this.images,
    required this.onDeleteImage,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(ResponsiveHelper.spacing(context, 2)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: ResponsiveHelper.spacing(context, 1.5),
          mainAxisSpacing: ResponsiveHelper.spacing(context, 1.5),
          childAspectRatio: 1,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return ImageItem(
            image: images[index],
            onDelete: () => onDeleteImage(index),
          );
        },
      ),
    );
  }
}

class ImageItem extends StatelessWidget {
  final GalleryImage image;
  final VoidCallback onDelete;

  const ImageItem({super.key, required this.image, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              File(image.path),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: onDelete,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.delete, size: 20, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
