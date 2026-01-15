import 'package:flutter/material.dart';
import 'package:rclink_app/shared/widgets/template_page.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../domain/entities/quantity_type_nested_entity.dart';
import 'program_quantity_fields_page.dart';

class ProgramQuantitySelectionPage extends StatefulWidget {
  final List<QuantityTypeNested> quantityTypes;
  final bool allowMultipleQuantities;
  final Map<String, Map<String, dynamic>> existingQuantityData;

  const ProgramQuantitySelectionPage({
    super.key,
    required this.quantityTypes,
    required this.allowMultipleQuantities,
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

  bool get _canAddMoreQuantities {
    if (widget.allowMultipleQuantities) {
      return true; // No limit
    }
    // Single quantity only
    return _quantityData.isEmpty;
  }

  void _handleAddQuantity() {
    if (!_canAddMoreQuantities) {
      CustomSnackBar.show(
        context,
        'Only one quantity type allowed for this work scope',
        type: SnackBarType.warning,
      );
      return;
    }

    final quantityNames = widget.quantityTypes
        .map((qt) => qt.name ?? '')
        .toList();

    if (quantityNames.isEmpty) {
      CustomSnackBar.show(
        context,
        'No quantities available',
        type: SnackBarType.warning,
      );
      return;
    }

    // Show bottomsheet with isNavigate: true and onTap
    showFlexibleBottomsheet(
      context: context,
      title: 'Select Quantity Type',
      attributes: quantityNames,
      isRadio: false,
      isNavigate: true,
      onTap: (selectedName) {
        Navigator.pop(context);

        Future.delayed(Duration(milliseconds: 100), () async {
          final selectedType = widget.quantityTypes.firstWhere(
            (qt) => qt.name == selectedName,
          );

          // Check if already added
          if (_quantityData.containsKey(selectedType.uid)) {
            CustomSnackBar.show(
              context,
              'This quantity type is already added',
              type: SnackBarType.warning,
            );
            return;
          }

          _navigateToQuantityFields(selectedType);
        });
      },
    );
  }

  void _navigateToQuantityFields(QuantityTypeNested quantityType) async {
    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (context) => ProgramQuantityFieldsPage(
          quantityType: quantityType,
          existingData: _quantityData[quantityType.uid],
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _quantityData[quantityType.uid!] = result;
      });

      print('✅ Quantity saved: ${quantityType.name}');

      // ✅ Auto-pop back to draft page after saving
      Navigator.pop(context, _quantityData);
    }
  }

  void _handleEditQuantity(String quantityTypeUID) {
    final quantityType = widget.quantityTypes.firstWhere(
      (qt) => qt.uid == quantityTypeUID,
    );

    _navigateToQuantityFields(quantityType);
  }

  void _handleDeleteQuantity(String quantityTypeUID) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Quantity'),
        content: Text('Are you sure you want to delete this quantity?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _quantityData.remove(quantityTypeUID);
              });

              Navigator.pop(context);

              CustomSnackBar.show(
                context,
                'Quantity deleted',
                type: SnackBarType.success,
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _handleDone() {
    if (_quantityData.isEmpty) {
      CustomSnackBar.show(
        context,
        'Please add at least one quantity',
        type: SnackBarType.warning,
      );
      return;
    }

    Navigator.pop(context, _quantityData);
  }

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      pageTitle: 'Select Quantities',
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // Summary banner
            //
            // if (!widget.allowMultipleQuantities)
            //   Container(
            //     width: double.infinity,
            //     padding: ResponsiveHelper.padding(context, all: 12),
            //     color: Colors.orange.shade50,
            //     child: Row(
            //       children: [
            //         Icon(Icons.info_outline, color: Colors.orange, size: 20),
            //         SizedBox(width: 10),
            //         Expanded(
            //           child: Text(
            //             'Only one quantity type allowed',
            //             style: TextStyle(
            //               fontSize: ResponsiveHelper.fontSize(context, base: 13),
            //               color: Colors.orange.shade700,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),

            // List of added quantities
            Expanded(
              child: _quantityData.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.construction,
                            size: 64,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Empty Quantity',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Add quantity to display',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: ResponsiveHelper.padding(context, all: 20),
                      itemCount: _quantityData.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final quantityTypeUID = _quantityData.keys.elementAt(
                          index,
                        );
                        final quantityData = _quantityData[quantityTypeUID]!;
                        final quantityType = widget.quantityTypes.firstWhere(
                          (qt) => qt.uid == quantityTypeUID,
                        );

                        return _buildQuantityCard(
                          quantityType: quantityType,
                          quantityData: quantityData,
                          onEdit: () => _handleEditQuantity(quantityTypeUID),
                          onDelete: () =>
                              _handleDeleteQuantity(quantityTypeUID),
                        );
                      },
                    ),
            ),

            // Add Quantity Button
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: _canAddMoreQuantities ? _handleAddQuantity : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: ResponsiveHelper.padding(context, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  '+  Add Quantity',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveHelper.fontSize(context, base: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityCard({
    required QuantityTypeNested quantityType,
    required Map<String, dynamic> quantityData,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    final fields = quantityData['fields'] as Map<String, dynamic>? ?? {};
    final segments = quantityData['segments'] as List<dynamic>? ?? [];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: ResponsiveHelper.padding(context, all: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    quantityType.name ?? '',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 16),
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onEdit,
                  icon: Icon(Icons.edit, color: primaryColor),
                  tooltip: 'Edit',
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete, color: Colors.red),
                  tooltip: 'Delete',
                ),
              ],
            ),

            SizedBox(height: 12),

            // Show field summary
            ...fields.entries.map((entry) {
              return Padding(
                padding: ResponsiveHelper.padding(context, bottom: 6),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 16,
                      color: Colors.green.shade700,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${_formatFieldName(entry.key)}: ${entry.value}',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 13,
                          ),
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),

            // Show segment count
            if (segments.isNotEmpty)
              Padding(
                padding: ResponsiveHelper.padding(context, top: 6),
                child: Row(
                  children: [
                    Icon(
                      Icons.space_dashboard,
                      size: 16,
                      color: Colors.orange.shade700,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${segments.length} segment${segments.length > 1 ? 's' : ''}',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 13),
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatFieldName(String fieldCode) {
    // Convert snake_case to Title Case
    return fieldCode
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
