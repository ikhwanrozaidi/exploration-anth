import 'package:flutter/material.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/info_bottomsheet.dart';

class WorkerNumberBottomsheet extends StatefulWidget {
  final int? initialWorkerCount;

  const WorkerNumberBottomsheet({Key? key, this.initialWorkerCount})
    : super(key: key);

  @override
  State<WorkerNumberBottomsheet> createState() =>
      _WorkerNumberBottomsheetState();

  static Future<int?> show(BuildContext context, {int? initialWorkerCount}) {
    return showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: WorkerNumberBottomsheet(initialWorkerCount: initialWorkerCount),
      ),
    );
  }

  static Future<int?> showWithInfoBottomsheet(
    BuildContext context, {
    int? initialWorkerCount,
  }) {
    return show(context, initialWorkerCount: initialWorkerCount);
  }
}

class _WorkerNumberBottomsheetState extends State<WorkerNumberBottomsheet> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialWorkerCount?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onContinue() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      // Show error if empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter number of workers'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final number = int.tryParse(text);
    if (number == null || number <= 0) {
      // Show error if invalid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid number'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Return the number
    Navigator.of(context).pop(number);
  }

  @override
  Widget build(BuildContext context) {
    return InfoBottomsheet(
      title: "Worker",
      blurry: true,
      widgetUI: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Worker",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          Text(
            "Number of Workers",
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),

          SizedBox(height: 5),

          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              hintText: "Enter number of workers",
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey, width: 0.8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey, width: 0.8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: primaryColor, width: 1.2),
              ),
            ),
          ),

          SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(null),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey[300],
                    padding: ResponsiveHelper.padding(
                      context,
                      vertical: 10,
                      horizontal: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: ResponsiveHelper.borderRadius(
                        context,
                        all: 10,
                      ),
                    ),
                    side: BorderSide(color: primaryColor, width: 1),
                    elevation: ResponsiveHelper.adaptive(
                      context,
                      mobile: 1,
                      tablet: 2,
                      desktop: 3,
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.spacing(context, 14),
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: ElevatedButton(
                  onPressed: _onContinue,
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
                        all: 10,
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
                    'Continue',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.spacing(context, 14),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
