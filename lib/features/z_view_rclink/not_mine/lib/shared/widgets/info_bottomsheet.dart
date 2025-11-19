import 'package:flutter/material.dart';
import 'dart:ui';

import '../utils/responsive_helper.dart';

/// ============================================================================
/// HOW TO USE InfoBottomsheet
/// ============================================================================
///
/// InfoBottomsheet is a reusable bottom sheet widget that displays custom content
/// with optional blur effect. It's best used through the helper function
/// `showInfoBottomsheet()` rather than directly instantiating the widget.
///
/// ============================================================================
/// BASIC USAGE
/// ============================================================================
///
/// void _showMyBottomSheet() {
///   showInfoBottomsheet(
///     context: context,
///     title: "My Title",
///     blurry: true,  // Optional: adds blur effect to background
///     widgetUI: Column(
///       mainAxisSize: MainAxisSize.min,
///       children: [
///         Text('Your content here'),
///         ElevatedButton(
///           onPressed: () => Navigator.pop(context),
///           child: Text('Close'),
///         ),
///       ],
///     ),
///   );
/// }
///
/// ============================================================================
/// COMMON USE CASES
/// ============================================================================
///
/// 1. SIMPLE TEXT CONTENT
///    showInfoBottomsheet(
///      context: context,
///      title: "Information",
///      widgetUI: Text('This is some information'),
///    );
///
/// 2. FORM WITH BUTTONS
///    showInfoBottomsheet(
///      context: context,
///      title: "Enter Details",
///      widgetUI: Column(
///        mainAxisSize: MainAxisSize.min,
///        children: [
///          TextField(decoration: InputDecoration(hintText: 'Name')),
///          SizedBox(height: 20),
///          Row(
///            children: [
///              Expanded(
///                child: OutlinedButton(
///                  onPressed: () => Navigator.pop(context),
///                  child: Text('Cancel'),
///                ),
///              ),
///              SizedBox(width: 10),
///              Expanded(
///                child: ElevatedButton(
///                  onPressed: () {
///                    // Save logic
///                    Navigator.pop(context);
///                  },
///                  child: Text('Save'),
///                ),
///              ),
///            ],
///          ),
///        ],
///      ),
///    );
///
/// 3. SELECTION LIST WITH RADIO BUTTONS
///    showInfoBottomsheet(
///      context: context,
///      title: "Select Option",
///      widgetUI: StatefulBuilder(
///        builder: (context, setState) {
///          String? selected;
///          return Column(
///            mainAxisSize: MainAxisSize.min,
///            children: [
///              RadioListTile(
///                dense: true,
///                title: Text('Option 1'),
///                value: 'option1',
///                groupValue: selected,
///                onChanged: (value) => setState(() => selected = value),
///              ),
///              RadioListTile(
///                dense: true,
///                title: Text('Option 2'),
///                value: 'option2',
///                groupValue: selected,
///                onChanged: (value) => setState(() => selected = value),
///              ),
///            ],
///          );
///        },
///      ),
///    );
///
/// 4. GRID LAYOUT (e.g., for shortcuts/tips)
///    showInfoBottomsheet(
///      context: context,
///      title: "Select Action",
///      widgetUI: Column(
///        mainAxisSize: MainAxisSize.min,
///        children: [
///          Row(
///            children: [
///              Expanded(
///                child: GestureDetector(
///                  onTap: () {
///                    Navigator.pop(context);
///                    // Handle action
///                  },
///                  child: Container(
///                    padding: EdgeInsets.all(15),
///                    decoration: BoxDecoration(
///                      border: Border.all(color: Colors.grey),
///                      borderRadius: BorderRadius.circular(12),
///                    ),
///                    child: Column(
///                      children: [
///                        Icon(Icons.add, size: 40),
///                        Text('Action 1'),
///                      ],
///                    ),
///                  ),
///                ),
///              ),
///              SizedBox(width: 15),
///              Expanded(
///                child: GestureDetector(
///                  onTap: () {
///                    Navigator.pop(context);
///                    // Handle action
///                  },
///                  child: Container(
///                    padding: EdgeInsets.all(15),
///                    decoration: BoxDecoration(
///                      border: Border.all(color: Colors.grey),
///                      borderRadius: BorderRadius.circular(12),
///                    ),
///                    child: Column(
///                      children: [
///                        Icon(Icons.edit, size: 40),
///                        Text('Action 2'),
///                      ],
///                    ),
///                  ),
///                ),
///              ),
///            ],
///          ),
///        ],
///      ),
///    );
///
/// ============================================================================
/// IMPORTANT NOTES
/// ============================================================================
///
/// ⚠️ DO NOT use Expanded widget inside widgetUI in scrollable contexts
///    - InfoBottomsheet wraps content in SingleChildScrollView
///    - Use SizedBox(width: double.infinity) for full-width buttons instead
///
/// ⚠️ Always set mainAxisSize: MainAxisSize.min on Column widgets
///    - This prevents layout issues with the flexible bottomsheet height
///
/// ⚠️ Close bottomsheet before navigation
///    - Always call Navigator.pop(context) before navigating to another page
///    - Example: Navigator.pop(context); Navigator.push(...);
///
/// ⚠️ For stateful content, use StatefulBuilder or create separate widget
///    - Example: Radio buttons, checkboxes, text fields that need updates
///
/// ✅ Use for: confirmations, forms, selections, information display
/// ❌ Don't use for: full-screen content, complex multi-step flows
///
/// ============================================================================
/// PARAMETERS
/// ============================================================================
///
/// @param context - BuildContext (required)
/// @param title - String displayed at the top (required)
/// @param blurry - bool, adds blur effect to background (default: false)
/// @param widgetUI - Widget for custom content (required)
///
/// ============================================================================
/// HELPER FUNCTIONS USING InfoBottomsheet
/// ============================================================================
///
/// For common patterns, create helper functions in separate files:
/// - showStatusSelection() - Status selection with radio buttons
/// - showTipsSelection() - Grid of tip cards
/// - showShortcutSelection() - Quick action shortcuts
/// - showWorkdayDetail() - Display workday information
///
/// See examples in:
/// - lib/shared/widgets/show_status_selection.dart
/// - lib/shared/widgets/show_tips_selection.dart
/// - lib/shared/widgets/show_shortcut_selection.dart
/// - lib/shared/widgets/show_workday_detail.dart
///
/// ============================================================================

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
