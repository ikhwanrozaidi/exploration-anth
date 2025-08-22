import 'package:flutter/material.dart';

class ListingItem extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onTap;
  final bool isBlack;

  const ListingItem({
    required this.image,
    required this.label,
    required this.onTap,
    required this.isBlack,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(image, fit: BoxFit.contain),
          ),
          SizedBox(height: isBlack ? 0 : 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isBlack ? Colors.black : Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
