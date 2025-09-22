import 'package:flutter/material.dart';

class CustomFieldTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? titleDetails;
  final String? controller;
  final VoidCallback onTap;
  final bool isRequired;
  final Color? iconBackgroundColor;
  final Color? iconColor;

  const CustomFieldTile({
    Key? key,
    required this.icon,
    required this.title,
    this.controller,
    this.titleDetails,
    required this.onTap,
    this.isRequired = false,
    this.iconBackgroundColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine text color based on whether controller is provided
    Color textColor = controller == null && isRequired
        ? Colors.red
        : const Color.fromARGB(255, 22, 205, 116);

    // Use provided text or titleDetails
    String displayText = titleDetails ?? 'Tap to select';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          iconBackgroundColor ??
                          Color.fromARGB(255, 214, 226, 255),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        icon,
                        color: iconColor ?? Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          displayText,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: textColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color.fromARGB(255, 214, 226, 255),
              ),
              child: Icon(
                Icons.chevron_right_rounded,
                color: iconColor ?? Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage examples:
class ExampleUsage extends StatelessWidget {
  String? selectedWorker;
  String? selectedEquipment;
  String? selectedMaterial;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Worker selection - required field (shows red when empty)
        CustomFieldTile(
          icon: Icons.person,
          title: 'Worker',
          controller: selectedWorker,
          titleDetails: 'Take picture of worker',
          onTap: () {
            // Handle worker selection
            print('Worker tile tapped');
          },
          isRequired: true, // This makes it show red when empty
        ),

        // Equipment selection - optional field
        CustomFieldTile(
          icon: Icons.construction,
          title: 'Equipment',
          controller: selectedEquipment,
          titleDetails: 'Select equipment used',
          onTap: () {
            // Handle equipment selection
            print('Equipment tile tapped');
          },
          iconBackgroundColor: Colors.orange.shade100,
          iconColor: Colors.orange.shade700,
        ),

        // Material selection - with custom colors
        CustomFieldTile(
          icon: Icons.inventory,
          title: 'Materials',
          controller: selectedMaterial,
          titleDetails: 'Add materials used',
          onTap: () {
            // Handle material selection
            print('Material tile tapped');
          },
          iconBackgroundColor: Colors.green.shade100,
          iconColor: Colors.green.shade700,
        ),

        // Completed task - shows data
        CustomFieldTile(
          icon: Icons.check_circle,
          title: 'Task Status',
          controller: 'Completed successfully',
          onTap: () {
            // Handle status tap
            print('Status tile tapped');
          },
          iconBackgroundColor: Colors.green.shade100,
          iconColor: Colors.green,
        ),
      ],
    );
  }
}

// Alternative version with more customization options
class AdvancedInfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? controller;
  final String? titleDetails;
  final VoidCallback onTap;
  final bool isRequired;
  final Color? iconBackgroundColor;
  final Color? iconColor;
  final Color? titleColor;
  final Color? detailsColor;
  final Color? errorColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const AdvancedInfoTile({
    Key? key,
    required this.icon,
    required this.title,
    this.controller,
    this.titleDetails,
    required this.onTap,
    this.isRequired = false,
    this.iconBackgroundColor,
    this.iconColor,
    this.titleColor,
    this.detailsColor,
    this.errorColor,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isEmpty = controller == null || controller!.isEmpty;
    Color textColor = isEmpty && isRequired
        ? (errorColor ?? Colors.red)
        : (detailsColor ?? Colors.black);

    String displayText = controller ?? titleDetails ?? 'Tap to select';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin ?? EdgeInsets.only(bottom: 15),
        padding: padding ?? EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(
            color: isEmpty && isRequired
                ? (errorColor ?? Colors.red).withOpacity(0.5)
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
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          iconBackgroundColor ??
                          Color.fromARGB(255, 214, 226, 255),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: iconColor ?? Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 14,
                            color: titleColor ?? Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          displayText,
                          style: TextStyle(
                            fontSize: fontSize ?? 14,
                            fontWeight: fontWeight ?? FontWeight.w700,
                            color: textColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color.fromARGB(255, 214, 226, 255),
              ),
              child: Icon(
                Icons.chevron_right_rounded,
                color: iconColor ?? Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
