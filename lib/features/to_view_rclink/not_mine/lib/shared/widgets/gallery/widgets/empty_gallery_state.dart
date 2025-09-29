import 'package:flutter/material.dart';

import '../../../utils/responsive_helper.dart';

class EmptyGalleryState extends StatelessWidget {
  const EmptyGalleryState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 60),

        // TODO: Replace with illustration asset given by Sinwei
        Container(
          width: ResponsiveHelper.spacing(context, 20),
          height: ResponsiveHelper.spacing(context, 20),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add_a_photo,
            size: ResponsiveHelper.spacing(context, 8),
            color: Colors.grey[400],
          ),
        ),

        SizedBox(height: 20),

        Text(
          'You need to take 4 Photos',
          style: TextStyle(
            fontSize: ResponsiveHelper.adaptive<double>(
              context,
              mobile: 18,
              tablet: 20,
              desktop: 22,
            ),
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: ResponsiveHelper.spacing(context, 1)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.spacing(context, 10),
          ),
          child: Text(
            'Click the camera button below to take a photo',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveHelper.spacing(context, 12),
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}
