import 'package:flutter/material.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../domain/entities/quantity_type_nested_entity.dart';
import 'program_quantity_detail_page.dart';

class ProgramQuantitySelectionPage extends StatefulWidget {
  final List<QuantityTypeNested> quantityTypes;
  final Map<String, Map<String, dynamic>> existingQuantityData;

  const ProgramQuantitySelectionPage({
    super.key,
    required this.quantityTypes,
    this.existingQuantityData = const {},
  });

  @override
  State<ProgramQuantitySelectionPage> createState() =>
      _ProgramQuantitySelectionPageState();
}

class _ProgramQuantitySelectionPageState
    extends State<ProgramQuantitySelectionPage> {
  late Map<String, Map<String, dynamic>> _quantityData;

  @override
  void initState() {
    super.initState();
    _quantityData = Map.from(widget.existingQuantityData);
  }

  void _handleQuantityTypeTap(QuantityTypeNested quantityType) async {
    final existingData = _quantityData[quantityType.uid];

    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (context) => ProgramQuantityDetailPage(
          quantityType: quantityType,
          existingData: existingData,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _quantityData[quantityType.uid!] = result;
      });

      print('✅ Quantity saved: ${quantityType.name}');
      print('   Data: $result');
    }
  }

  void _handleRemoveQuantity(String quantityTypeUID) {
    setState(() {
      _quantityData.remove(quantityTypeUID);
    });

    CustomSnackBar.show(
      context,
      'Quantity removed',
      type: SnackBarType.success,
    );
  }

  void _handleSave() {
    Navigator.pop(context, _quantityData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Quantities',
          style: TextStyle(
            fontSize: ResponsiveHelper.fontSize(context, base: 18),
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Added quantities summary
          if (_quantityData.isNotEmpty)
            Container(
              width: double.infinity,
              padding: ResponsiveHelper.padding(
                context,
                vertical: 12,
                horizontal: 20,
              ),
              color: Colors.green.shade50,
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 20),
                  SizedBox(width: 10),
                  Text(
                    '${_quantityData.length} quantit${_quantityData.length > 1 ? 'ies' : 'y'} added',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

          // Quantity types list
          Expanded(
            child: ListView.separated(
              padding: ResponsiveHelper.padding(context, all: 20),
              itemCount: widget.quantityTypes.length,
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                final quantityType = widget.quantityTypes[index];
                final isAdded = _quantityData.containsKey(quantityType.uid);

                return _buildQuantityTypeCard(
                  quantityType: quantityType,
                  isAdded: isAdded,
                  onTap: () => _handleQuantityTypeTap(quantityType),
                  onRemove: () => _handleRemoveQuantity(quantityType.uid!),
                );
              },
            ),
          ),

          // Save button
          Container(
            padding: ResponsiveHelper.padding(
              context,
              horizontal: 20,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _quantityData.isEmpty ? null : _handleSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: ResponsiveHelper.padding(context, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    'Save Quantities',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveHelper.fontSize(context, base: 16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityTypeCard({
    required QuantityTypeNested quantityType,
    required bool isAdded,
    required VoidCallback onTap,
    required VoidCallback onRemove,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: ResponsiveHelper.padding(context, all: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isAdded ? Colors.green : Colors.grey.shade300,
            width: isAdded ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isAdded
                    ? Colors.green.shade50
                    : Color.fromARGB(255, 214, 226, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                isAdded ? Icons.check_circle : Icons.construction,
                color: isAdded ? Colors.green : primaryColor,
                size: 24,
              ),
            ),

            SizedBox(width: 15),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quantityType.name ?? '',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 15),
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  if (quantityType.description != null &&
                      quantityType.description!.isNotEmpty) ...[
                    SizedBox(height: 4),
                    Text(
                      quantityType.description!,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 12),
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (quantityType.hasSegmentBreakdown == true) ...[
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.space_dashboard,
                          size: 14,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Segment: ${quantityType.segmentSize}m',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 11,
                            ),
                            color: Colors.orange.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            // Action button
            if (isAdded)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: onRemove,
                    icon: Icon(Icons.delete, color: Colors.red),
                    tooltip: 'Remove',
                  ),
                  Icon(Icons.edit, color: primaryColor),
                ],
              )
            else
              Icon(Icons.chevron_right, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }
}
