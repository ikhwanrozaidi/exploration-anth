import 'package:flutter/material.dart';

import '../../../../../../../shared/utils/custom_checkbox.dart';

class AgreementCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?>? onChanged;
  final Widget child;

  const AgreementCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          CustomCheckbox(
            value: isChecked,
            onChanged: onChanged,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged?.call(!isChecked),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}