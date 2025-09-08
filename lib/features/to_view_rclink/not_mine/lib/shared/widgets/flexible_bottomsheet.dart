import 'package:flutter/material.dart';
import 'dart:ui';

import '../utils/responsive_helper.dart';
import '../utils/theme.dart';

class FlexibleBottomsheet extends StatefulWidget {
  final String title;
  final List<String> attributes;
  final bool isRadio;
  final bool blurry;

  const FlexibleBottomsheet({
    Key? key,
    required this.title,
    required this.attributes,
    required this.isRadio,
    this.blurry = false,
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

          // Title
          Text(
            widget.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          SizedBox(height: 15),

          // Options list
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.attributes.length,
              itemBuilder: (context, index) {
                final attribute = widget.attributes[index];

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
                      _printSelection();
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
                      _printSelection();
                    },
                    activeColor: primaryColor,
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                }
              },
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

  void _printSelection() {
    if (widget.isRadio) {
      print('Selected Radio: $selectedRadioValue');
    } else {
      print('Selected Checkboxes: $selectedCheckboxValues');
    }
  }
}

// Helper function to show the bottomsheet
void showFlexibleBottomsheet({
  required BuildContext context,
  required String title,
  required List<String> attributes,
  required bool isRadio,
  bool blurry = false, // New optional parameter
  Function(dynamic)? onSelectionChanged,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => FlexibleBottomsheet(
      title: title,
      attributes: attributes,
      isRadio: isRadio,
      blurry: blurry, // Pass the blur parameter
    ),
  ).then((value) {
    // Handle result if needed
    if (onSelectionChanged != null && value != null) {
      onSelectionChanged(value);
    }
  });
}
