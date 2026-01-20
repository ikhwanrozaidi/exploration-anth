import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../road/domain/entities/road_entity.dart';

class SectionBasedInputWidget extends StatefulWidget {
  final Road road;
  final Map<String, dynamic>? initialData;
  final Function(Map<String, dynamic>) onChanged;

  const SectionBasedInputWidget({
    super.key,
    required this.road,
    this.initialData,
    required this.onChanged,
  });

  @override
  State<SectionBasedInputWidget> createState() =>
      _SectionBasedInputWidgetState();
}

class _SectionBasedInputWidgetState extends State<SectionBasedInputWidget> {
  late TextEditingController _fromController;
  late TextEditingController _toController;

  double? _fromValue;
  double? _toValue;

  @override
  void initState() {
    super.initState();

    _fromValue = widget.initialData?['fromSection']?.toDouble();
    _toValue = widget.initialData?['toSection']?.toDouble();

    _fromController = TextEditingController(text: _fromValue?.toString() ?? '');
    _toController = TextEditingController(text: _toValue?.toString() ?? '');
  }

  @override
  void didUpdateWidget(SectionBasedInputWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update values if initialData has changed
    if (widget.initialData != oldWidget.initialData) {
      final newFromValue = widget.initialData?['fromSection']?.toDouble();
      final newToValue = widget.initialData?['toSection']?.toDouble();

      // Only update if values actually changed to avoid unnecessary updates
      if (newFromValue != _fromValue || newToValue != _toValue) {
        setState(() {
          _fromValue = newFromValue;
          _toValue = newToValue;
        });

        _fromController.text = _fromValue?.toString() ?? '';
        _toController.text = _toValue?.toString() ?? '';

        print('📍 Section input updated: $_fromValue - $_toValue');
      }
    }
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  void _validateAndNotify() {
    final from = double.tryParse(_fromController.text);
    final to = double.tryParse(_toController.text);

    if (from != null && to != null) {
      setState(() {
        _fromValue = from;
        _toValue = to;
      });

      widget.onChanged({'fromSection': from, 'toSection': to});
    }
  }

  bool _isValidRange() {
    if (_fromValue == null || _toValue == null) return true;

    final roadStart = widget.road.sectionStart ?? 0;
    final roadFinish = widget.road.sectionFinish ?? 0;

    return _fromValue! >= roadStart &&
        _toValue! <= roadFinish &&
        _fromValue! < _toValue!;
  }

  @override
  Widget build(BuildContext context) {
    final roadStart = widget.road.sectionStart ?? 0;
    final roadFinish = widget.road.sectionFinish ?? 0;
    final hasError = !_isValidRange();

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: hasError ? Colors.red.shade50 : primaryShade,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.swap_calls,
                color: hasError ? Colors.red : primaryColor,
                size: ResponsiveHelper.iconSize(context, base: 20),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 12,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _fromController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d*'),
                              ),
                            ],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.start,
                            onChanged: (value) {
                              // Only notify on field completion (empty or valid number)
                              if (value.isEmpty ||
                                  double.tryParse(value) != null) {
                                _validateAndNotify();
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              isDense: true,
                              hintText: roadStart.toString(),
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: hasError
                                      ? Colors.red
                                      : Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: hasError ? Colors.red : primaryColor,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 12,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            controller: _toController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^\d*\.?\d*'),
                              ),
                            ],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.start,
                            onChanged: (value) {
                              // Only notify on field completion (empty or valid number)
                              if (value.isEmpty ||
                                  double.tryParse(value) != null) {
                                _validateAndNotify();
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              isDense: true,
                              hintText: roadFinish.toString(),
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: hasError
                                      ? Colors.red
                                      : Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: hasError ? Colors.red : primaryColor,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  hasError && _fromValue != null && _toValue != null
                      ? 'Invalid range! Must be within $roadStart to $roadFinish and From < To'
                      : 'Range from $roadStart to $roadFinish',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: ResponsiveHelper.fontSize(context, base: 11),
                    color: hasError ? Colors.red : Colors.black,
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
