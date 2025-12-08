import 'package:flutter/material.dart';
import '../../../../../../../../lib/features/z_view_rclink/not_mine/shared/utils/theme.dart';
import '../../../../../../../../lib/features/z_view_rclink/not_mine/shared/widgets/divider_config.dart';
import '../../../domain/entities/report_quantity.dart';

class QuantityCard extends StatefulWidget {
  final ReportQuantity reportQuantity;
  final void Function(String quantityTypeUID, String fieldUID, String value)
  onValueChanged;

  const QuantityCard({
    super.key,
    required this.reportQuantity,
    required this.onValueChanged,
  });

  @override
  State<QuantityCard> createState() => _QuantityCardState();
}

class _QuantityCardState extends State<QuantityCard> {
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();

    for (var qv in widget.reportQuantity.quantityValues) {
      _controllers[qv.quantityField.uid] = TextEditingController(
        text: qv.value, // Populate initial value from existing data
      );
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  TextInputType _getKeyboardType(String fieldType) {
    switch (fieldType.toUpperCase()) {
      case 'DECIMAL':
        return const TextInputType.numberWithOptions(decimal: true);
      case 'NUMBER':
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  void _handleChange(String fieldUID, String fieldType, String value) {
    if (value.isEmpty) return;

    switch (fieldType.toUpperCase()) {
      case 'DECIMAL':
        if (double.tryParse(value) == null) return;
        break;
      case 'NUMBER':
        if (int.tryParse(value) == null) return;
        break;
    }

    widget.onValueChanged(
      widget.reportQuantity.quantityType.uid,
      fieldUID,
      value,
    );
  }

  @override
  Widget build(BuildContext context) {
    final quantity = widget.reportQuantity;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 0.5),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quantity Type Title
            Text(
              quantity.quantityType.name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),

            dividerConfig(),

            // Each Quantity Field
            ...quantity.quantityValues.map((qv) {
              final field = qv.quantityField;
              final controller = _controllers[field.uid]!;

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      field.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: controller,
                      keyboardType: _getKeyboardType(field.fieldType),
                      onChanged: (value) =>
                          _handleChange(field.uid, field.fieldType, value),
                      decoration: InputDecoration(
                        hintText: "Enter value...",
                        suffix: field.unit != null
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  field.unit!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            : null,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
