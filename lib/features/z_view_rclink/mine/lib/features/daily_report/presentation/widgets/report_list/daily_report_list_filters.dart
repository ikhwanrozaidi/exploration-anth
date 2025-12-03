import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';

class DailyReportListFilters extends StatelessWidget {
  final VoidCallback? onDistrictTap;
  final VoidCallback? onContractorTap;
  final VoidCallback? onScopeTap;

  const DailyReportListFilters({
    Key? key,
    this.onDistrictTap,
    this.onContractorTap,
    this.onScopeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Contractor
          Expanded(
            child: _FilterButton(
              icon: Icons.location_city,
              label: 'District',
              onTap: onDistrictTap,
            ),
          ),
          SizedBox(width: 10),
          // Scope Work
          Expanded(
            child: _FilterButton(
              icon: Icons.person_2_rounded,
              label: 'Contractor',
              onTap: onContractorTap,
            ),
          ),
          SizedBox(width: 10),
          // Status
          Expanded(
            child: _FilterButton(
              icon: Icons.restaurant_menu,
              label: 'Scope Work',
              onTap: onScopeTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _FilterButton({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        backgroundColor: Colors.white,
      ),
      onPressed: onTap ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(icon, size: 10, color: Colors.black),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis,
                      fontSize: ResponsiveHelper.fontSize(context, base: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.expand_more, size: 15, color: Colors.black),
        ],
      ),
    );
  }
}
