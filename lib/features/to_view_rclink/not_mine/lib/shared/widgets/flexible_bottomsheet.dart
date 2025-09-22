import 'package:flutter/material.dart';
import 'dart:ui';

import '../utils/responsive_helper.dart';
import '../utils/theme.dart';

class FlexibleBottomsheet extends StatefulWidget {
  final String title;
  final List<String> attributes;
  final bool isRadio;
  final bool blurry;
  final bool isNavigate; // Parameter for navigation mode
  final bool isTips; // New parameter to show/hide Tips button
  final Function(dynamic)? onSelectionChanged;
  final Function(String)? onTap; // Callback for navigation
  final VoidCallback? onPressTips; // New callback for Tips button
  final String? tipsTitle;

  const FlexibleBottomsheet({
    Key? key,
    required this.title,
    required this.attributes,
    required this.isRadio,
    this.blurry = false,
    this.isNavigate = false, // Default to false for backward compatibility
    this.isTips = false, // Default to false to hide Tips button
    this.onSelectionChanged,
    this.onTap,
    this.onPressTips,
    this.tipsTitle,
  }) : super(key: key);

  @override
  State<FlexibleBottomsheet> createState() => _FlexibleBottomsheetState();
}

class _FlexibleBottomsheetState extends State<FlexibleBottomsheet> {
  // For radio button - single selection
  String? selectedRadioValue;

  // For checkbox - multiple selection
  List<String> selectedCheckboxValues = [];

  @override
  Widget build(BuildContext context) {
    Widget bottomsheetContent = Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
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

          SizedBox(height: 15),

          // Revise Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              if (widget.isTips)
                TextButton(
                  onPressed: widget.onPressTips,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: primaryColor,
                    side: BorderSide(color: primaryColor, width: 1.5),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(widget.tipsTitle ?? 'Tips'),
                ),
            ],
          ),

          SizedBox(height: 15),

          // Options list
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.attributes.length,
              itemBuilder: (context, index) {
                final attribute = widget.attributes[index];

                // Navigation mode - simple list items with onTap
                if (widget.isNavigate) {
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                    title: Text(
                      attribute,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 16),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade400,
                      size: 16,
                    ),
                    onTap: () {
                      // Call the onTap callback
                      widget.onTap?.call(attribute);
                      // Don't manually close bottomsheet in navigation mode
                      // Let the navigation handle the UI transitions
                    },
                  );
                }

                // Original selection mode
                if (widget.isRadio) {
                  // Radio button implementation
                  return RadioListTile<String>(
                    dense: true,
                    contentPadding: EdgeInsets.all(0),
                    title: Text(
                      attribute,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 16),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    value: attribute,
                    groupValue: selectedRadioValue,
                    onChanged: (String? value) {
                      setState(() {
                        selectedRadioValue = value;
                      });
                      // Call the callback and close the bottomsheet
                      widget.onSelectionChanged?.call(value);
                      Navigator.pop(context);
                    },
                    activeColor: primaryColor,
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                } else {
                  // Checkbox implementation
                  return CheckboxListTile(
                    dense: true,
                    title: Text(
                      attribute,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 16),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    value: selectedCheckboxValues.contains(attribute),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedCheckboxValues.add(attribute);
                        } else {
                          selectedCheckboxValues.remove(attribute);
                        }
                      });
                    },
                    activeColor: primaryColor,
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                }
              },
            ),
          ),

          // Done button for multi-select (checkbox) - not shown in navigation mode
          if (!widget.isRadio && !widget.isNavigate)
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onSelectionChanged?.call(selectedCheckboxValues);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );

    // Apply blur effect if blurry is true
    if (widget.blurry) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.black.withOpacity(0.2), // Semi-transparent overlay
          child: bottomsheetContent,
        ),
      );
    } else {
      return bottomsheetContent;
    }
  }
}

// Updated helper function to show the bottomsheet
void showFlexibleBottomsheet({
  required BuildContext context,
  required String title,
  required List<String> attributes,
  required bool isRadio,
  bool blurry = false,
  bool isNavigate = false,
  bool isTips = false, // New parameter
  Function(dynamic)? onSelectionChanged,
  Function(String)? onTap,
  VoidCallback? onPressTips, // New parameter
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => FlexibleBottomsheet(
      title: title,
      attributes: attributes,
      isRadio: isRadio,
      blurry: blurry,
      isNavigate: isNavigate,
      isTips: isTips,
      onSelectionChanged: onSelectionChanged,
      onTap: onTap,
      onPressTips: onPressTips,
    ),
  ).then((value) {
    // Handle result if needed - only for non-navigation mode
    if (!isNavigate && onSelectionChanged != null && value != null) {
      onSelectionChanged(value);
    }
  });
}
