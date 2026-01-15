import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';

class FixedCountInputWidget extends StatefulWidget {
  final String inputLabel;
  final String unitMeasurement;
  final Map<String, dynamic>? initialData;
  final Function(Map<String, dynamic>) onChanged;

  const FixedCountInputWidget({
    super.key,
    required this.inputLabel,
    required this.unitMeasurement,
    this.initialData,
    required this.onChanged,
  });

  @override
  State<FixedCountInputWidget> createState() => _FixedCountInputWidgetState();
}

class _FixedCountInputWidgetState extends State<FixedCountInputWidget> {
  late TextEditingController _inputController;

  @override
  void initState() {
    super.initState();

    final initialValue = widget.initialData?['inputValue'];
    _inputController = TextEditingController(
      text: initialValue?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _notifyChange() {
    final value = double.tryParse(_inputController.text);
    if (value != null) {
      widget.onChanged({'inputValue': value});
    } else if (_inputController.text.isEmpty) {
      widget.onChanged({'inputValue': null});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.inputLabel,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: ResponsiveHelper.fontSize(context, base: 14),
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _inputController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                    ],
                    onChanged: (value) {
                      // Only notify on field completion
                      if (value.isEmpty || double.tryParse(value) != null) {
                        _notifyChange();
                      }
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'e.g 30',
                      hintStyle: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    widget.unitMeasurement,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveHelper.fontSize(context, base: 12),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
