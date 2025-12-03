import 'package:flutter/material.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/info_bottomsheet.dart';

/// Helper function to show status selection bottomsheet
///
/// This function displays status options with radio buttons.
///
/// Usage:
/// ```dart
/// showStatusSelection(
///   context: context,
///   currentStatus: 'No Action Yet',
///   onStatusSelected: (selectedStatus) {
///     print('Selected: $selectedStatus');
///   },
/// );
/// ```

void showStatusSelection({
  required BuildContext context,
  String? currentStatus,
  required Function(String) onStatusSelected,
}) {
  showInfoBottomsheet(
    context: context,
    title: "Status",
    blurry: false,
    widgetUI: _StatusSelectionContent(
      currentStatus: currentStatus,
      onStatusSelected: onStatusSelected,
    ),
  );
}

class _StatusSelectionContent extends StatefulWidget {
  final String? currentStatus;
  final Function(String) onStatusSelected;

  const _StatusSelectionContent({
    required this.currentStatus,
    required this.onStatusSelected,
  });

  @override
  State<_StatusSelectionContent> createState() =>
      _StatusSelectionContentState();
}

class _StatusSelectionContentState extends State<_StatusSelectionContent> {
  late String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.currentStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // No Action Yet option
        RadioListTile<String>(
          dense: true,
          visualDensity: VisualDensity.compact,
          title: Text(
            'No Action Yet',
            style: TextStyle(
              fontSize: ResponsiveHelper.fontSize(context, base: 14),
              fontWeight: FontWeight.w500,
            ),
          ),
          value: 'No Action Yet',
          groupValue: _selectedStatus,
          onChanged: (value) {
            setState(() {
              _selectedStatus = value;
            });
          },
          activeColor: primaryColor,
          contentPadding: EdgeInsets.zero,
        ),

        // Closed / Resolved option
        RadioListTile<String>(
          dense: true,
          visualDensity: VisualDensity.compact,
          title: Text(
            'Closed / Resolved',
            style: TextStyle(
              fontSize: ResponsiveHelper.fontSize(context, base: 14),
              fontWeight: FontWeight.w500,
            ),
          ),
          value: 'Closed / Resolved',
          groupValue: _selectedStatus,
          onChanged: (value) {
            setState(() {
              _selectedStatus = value;
            });
          },
          activeColor: primaryColor,
          contentPadding: EdgeInsets.zero,
        ),

        const SizedBox(height: 15),

        // Action buttons
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: primaryColor,
                    width: ResponsiveHelper.adaptive(
                      context,
                      mobile: 1.0,
                      tablet: 1.5,
                      desktop: 2.0,
                    ),
                  ),
                  padding: ResponsiveHelper.padding(
                    context,
                    vertical: 10,
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: ResponsiveHelper.borderRadius(
                      context,
                      all: 14,
                    ),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(context, base: 14),
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Save button
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedStatus != null) {
                    Navigator.pop(context);
                    widget.onStatusSelected(_selectedStatus!);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  disabledBackgroundColor: Colors.grey[300],
                  padding: ResponsiveHelper.padding(
                    context,
                    vertical: 10,
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: ResponsiveHelper.borderRadius(
                      context,
                      all: 14,
                    ),
                  ),
                  elevation: ResponsiveHelper.adaptive(
                    context,
                    mobile: 1,
                    tablet: 2,
                    desktop: 3,
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(context, base: 14),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}
