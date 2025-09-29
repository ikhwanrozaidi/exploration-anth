import 'package:flutter/material.dart';
import '../../../utils/responsive_helper.dart';

class CameraButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CameraButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      backgroundColor: const Color(0xFF1E3A8A),
      child: Icon(Icons.camera_alt, size: 20, color: Colors.white),
    );
  }
}
