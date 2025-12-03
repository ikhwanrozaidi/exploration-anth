import 'package:flutter/material.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';

/// Reusable selection field card widget
/// Used for Scope of Work, Weather, Location, and Section fields
class SelectionFieldCard extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final String label;
  final String value;
  final String placeholder;
  final VoidCallback? onTap;
  final bool hasError;
  final String? errorMessage;
  final bool isEditable;
  final Widget? subtitle;

  const SelectionFieldCard({
    Key? key,
    this.icon,
    this.imagePath,
    required this.label,
    required this.value,
    required this.placeholder,
    this.onTap,
    this.hasError = false,
    this.errorMessage,
    this.isEditable = true,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEmpty = value.isEmpty;
    final displayValue = isEmpty ? placeholder : value;

    return GestureDetector(
      onTap: isEditable ? onTap : null,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: ResponsiveHelper.padding(
          context,
          vertical: 15,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: hasError && errorMessage != null
                ? Colors.red
                : Colors.grey.shade400,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  // Icon container
                  Container(
                    padding: ResponsiveHelper.padding(context, all: 10),
                    decoration: BoxDecoration(
                      color: hasError && errorMessage != null
                          ? Colors.red.shade50
                          : const Color.fromARGB(255, 214, 226, 255),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: imagePath != null
                          ? Container(
                              height: ResponsiveHelper.spacing(context, 20),
                              margin: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(
                                imagePath ?? '',
                                fit: BoxFit.contain,
                              ),
                            )
                          : Icon(
                              icon,
                              color: hasError && errorMessage != null
                                  ? Colors.red
                                  : primaryColor,
                            ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  // Label and value
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 13,
                            ),
                            color: hasError && errorMessage != null
                                ? Colors.red.shade600
                                : Colors.black,
                          ),
                        ),
                        if (subtitle != null)
                          subtitle!
                        else
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Text(
                              displayValue,
                              style: TextStyle(
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 13,
                                ),
                                fontWeight: FontWeight.w700,
                                color: isEmpty
                                    ? Colors.red
                                    : hasError && errorMessage != null
                                    ? Colors.red
                                    : Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Arrow indicator (only for non-editable fields or with onTap)
            if (isEditable && onTap != null)
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color.fromARGB(255, 214, 226, 255),
                ),
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: primaryColor,
                  size: ResponsiveHelper.iconSize(context, base: 20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
