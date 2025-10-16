import 'package:flutter/material.dart';
import 'package:rclink_app/shared/utils/theme.dart';

import '../../../utils/responsive_helper.dart';

class CameraButton extends StatelessWidget {
  final VoidCallback onPressed;
  final int? imageCount;
  final int? minimumImage;
  final bool isLoading;

  const CameraButton({
    super.key,
    required this.onPressed,
    this.imageCount,
    this.minimumImage,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final showCounter = minimumImage != null && imageCount != null;
    final imageLeft = showCounter ? minimumImage! - imageCount! : 0;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        FloatingActionButton(
          onPressed: isLoading ? null : onPressed,
          backgroundColor: isLoading ? Colors.grey[400] : primaryColor,
          shape: const CircleBorder(),
          child: isLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Icon(Icons.camera_alt, size: 25, color: Colors.white),
        ),
        if (showCounter && imageLeft > 0 && !isLoading)
          Positioned(
            top: -10,
            right: -10,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(
                minWidth: ResponsiveHelper.spacing(context, 2.5),
                minHeight: ResponsiveHelper.spacing(context, 2.5),
              ),
              child: Center(
                child: Text(
                  '$imageLeft',
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
