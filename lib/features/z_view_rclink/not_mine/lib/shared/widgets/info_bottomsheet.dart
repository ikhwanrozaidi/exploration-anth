import 'package:flutter/material.dart';
import 'dart:ui';

import '../utils/responsive_helper.dart';

class InfoBottomsheet extends StatefulWidget {
  final String? title;
  final bool blurry;
  final Widget widgetUI;

  const InfoBottomsheet({
    Key? key,
    this.title,
    this.blurry = false,
    required this.widgetUI,
  }) : super(key: key);

  @override
  State<InfoBottomsheet> createState() => _InfoBottomsheetState();
}

class _InfoBottomsheetState extends State<InfoBottomsheet> {
  @override
  Widget build(BuildContext context) {
    Widget bottomsheetContent = Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          widget.title == null
              ? SizedBox.shrink()
              : Text(
                  widget.title ?? '',
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(context, base: 16),
                    fontWeight: FontWeight.w600,
                  ),
                ),

          const SizedBox(height: 20),

          Flexible(child: SingleChildScrollView(child: widget.widgetUI)),

          const SizedBox(height: 20),
        ],
      ),
    );

    if (widget.blurry) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.black.withOpacity(0.2),
          child: bottomsheetContent,
        ),
      );
    } else {
      return bottomsheetContent;
    }
  }
}

// Updated helper function to show the bottomsheet
void showInfoBottomsheet({
  required BuildContext context,
  String? title,
  bool blurry = false,
  required Widget widgetUI,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    enableDrag: true,
    builder: (context) =>
        InfoBottomsheet(title: title, blurry: blurry, widgetUI: widgetUI),
  );
}
