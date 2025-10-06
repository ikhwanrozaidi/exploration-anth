import 'package:flutter/material.dart';

import '../../../utils/responsive_helper.dart';

class EmptyGalleryState extends StatelessWidget {
  final int? imageCount;

  const EmptyGalleryState({super.key, this.imageCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),

        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/empty_state_conditionsnapshot.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(height: 20),

        Text(
          imageCount == null
              ? 'Upload your Photos'
              : 'You need to take $imageCount Photos',
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
