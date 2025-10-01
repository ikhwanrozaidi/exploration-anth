import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../domain/entities/scope_of_work/work_equipment.dart';

class EquipmentPage extends StatefulWidget {
  final List<WorkEquipment> equipmentLists;
  final List<Map<String, dynamic>> addedEquipments;

  const EquipmentPage({
    Key? key,
    required this.equipmentLists,
    required this.addedEquipments,
  }) : super(key: key);

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  late List<Map<String, dynamic>> selectedEquipments;
  late Set<String> selectedEquipmentUids;

  @override
  void initState() {
    super.initState();
    selectedEquipments = List.from(widget.addedEquipments);
    selectedEquipmentUids = selectedEquipments
        .map((equipment) => equipment['uid'] as String)
        .toSet();
  }

  void _toggleEquipment(WorkEquipment equipment) {
    setState(() {
      if (selectedEquipmentUids.contains(equipment.uid)) {
        // Remove equipment
        selectedEquipmentUids.remove(equipment.uid);
        selectedEquipments.removeWhere(
          (selected) => selected['uid'] == equipment.uid,
        );
      } else {
        // Add equipment
        selectedEquipmentUids.add(equipment.uid);
        selectedEquipments.add({'uid': equipment.uid, 'name': equipment.name});
      }
    });
  }

  void _showAddEquipmentBottomSheet() {
    showFlexibleBottomsheet(
      context: context,
      title: 'Add Equipment',
      attributes: ['Hello World'],
      isRadio: false,
      onTap: (selectedValue) {
        Navigator.pop(context);
        print('Add equipment: $selectedValue');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context, selectedEquipments);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(-2, 6),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),

            SizedBox(width: ResponsiveHelper.spacing(context, 15)),

            const Text(
              'Equipment',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Equipment / Vehicles / Machine',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        ...widget.equipmentLists.map((equipment) {
                          final isSelected = selectedEquipmentUids.contains(
                            equipment.uid,
                          );
                          return _buildEquipmentButton(
                            equipment.name,
                            isSelected,
                            () => _toggleEquipment(equipment),
                          );
                        }),

                        _buildAddButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, selectedEquipments);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: ResponsiveHelper.padding(context, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveHelper.fontSize(context, base: 14),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildEquipmentButton(
    String name,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (isSelected) ...[
              SizedBox(width: 8),
              Icon(Icons.check, size: 16, color: Colors.white),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: _showAddEquipmentBottomSheet,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, size: 16, color: Colors.grey.shade600),
            SizedBox(width: 4),
            Text('Add', style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}
