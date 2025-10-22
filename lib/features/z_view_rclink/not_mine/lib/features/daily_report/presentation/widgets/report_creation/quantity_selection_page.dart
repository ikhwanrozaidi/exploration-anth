import 'package:flutter/material.dart';
import 'package:rclink_app/features/daily_report/presentation/constant/report_model.dart';
import 'package:rclink_app/features/work_scope/domain/entities/quantity_field.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_quantity_type.dart';
import 'package:rclink_app/shared/widgets/divider_config.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';

import '../../../../daily_report/data/mapper/hybrid_field_mapper.dart';
import 'quantity_fields_page.dart';

class QuantitySelectionPage extends StatefulWidget {
  final List<Map<String, dynamic>> addedQuantities;
  final List<WorkQuantityType> quantityLists;
  final String? selectedScopeUid;

  const QuantitySelectionPage({
    super.key,
    required this.addedQuantities,
    required this.quantityLists,
    this.selectedScopeUid,
  });

  @override
  State<QuantitySelectionPage> createState() => _QuantitySelectionPageState();
}

class _QuantitySelectionPageState extends State<QuantitySelectionPage> {
  late List<Map<String, dynamic>> currentQuantities;

  @override
  void initState() {
    super.initState();
    currentQuantities = List.from(widget.addedQuantities);
  }

  void _navigateToQuantityFields(
    WorkQuantityType selectedQuantity,
    Map<String, dynamic>? existingData,
  ) async {
    final scopeId = 'R02';

    // Convert API fields using hybrid mapper
    final mappedFields = selectedQuantity.quantityFields
        .map(
          (quantityField) =>
              HybridFieldMapper.fromQuantityField(quantityField, scopeId),
        )
        .toList();

    final quantityOption = QuantityOption(
      id: selectedQuantity.uid,
      name: selectedQuantity.name,
      fields: mappedFields,
    );

    // Get appropriate common fields based on scope
    // final commonFields = scopeId == 'R05'
    //     ? ScopeConfigurations.getR05CommonFields()
    //     : ScopeConfigurations.getCommonFields();

    final scopeConfig = ScopeConfig(
      id: scopeId,
      name: 'Dynamic Config',
      // commonFields: commonFields,
      quantityOptions: [quantityOption],
    );

    // Get segment-specific fields
    // Get segment-specific fields
    final segmentFields = selectedQuantity.quantityFields
        .where((field) => field.isForSegment == true)
        .toList();

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuantityFieldsPage(
          scopeOfWork: 'Dynamic Scope',
          weather: 'N/A',
          location: 'N/A',
          section: 'N/A',
          quantityOption: quantityOption,
          scopeConfig: scopeConfig,
          existingData: existingData,
          hasSegmentBreakdown: selectedQuantity.hasSegmentBreakdown,
          selectedScopeUid: widget.selectedScopeUid,
          segmentSize: selectedQuantity.segmentSize,
          maxSegmentLength: selectedQuantity.maxSegmentLength,
          segmentFields: segmentFields,
          allQuantityFields: selectedQuantity.quantityFields,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        currentQuantities.removeWhere((q) => q['id'] == selectedQuantity.uid);
        currentQuantities.add({
          'id': selectedQuantity.uid,
          'name': selectedQuantity.name,
          'data': result,
        });
      });
    }
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
                Navigator.pop(context, currentQuantities);
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
              'Quantity',
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
            Expanded(
              child: currentQuantities.isNotEmpty
                  ? ListView.builder(
                      itemCount: currentQuantities.length,
                      itemBuilder: (context, index) {
                        final quantity = currentQuantities[index];
                        return _buildQuantityCard(quantity, index);
                      },
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.category_outlined,
                            size: 80,
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
                    ),
            ),

            // Add Quantity Button
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () => _showQuantityOptions(),
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

  Widget _buildQuantityCard(Map<String, dynamic> quantity, int index) {
    final data = quantity['data'] as Map<String, dynamic>?;
    final fieldValues = data?['fieldValues'] as Map<String, dynamic>? ?? {};
    final imageFields =
        data?['imageFields'] as Map<String, List<String>>? ?? {};

    final workQuantityType = widget.quantityLists.firstWhere(
      (wqt) => wqt.uid == quantity['id'],
    );

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () async {
          _navigateToQuantityFields(workQuantityType, quantity['data']);
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Section
            if (fieldValues.values.any(
                  (value) => value != null && value.toString().isNotEmpty,
                ) ||
                imageFields.values.any((images) => images.isNotEmpty)) ...[
              SizedBox(height: 12),

              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quantity['name'] ?? workQuantityType.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),

                    dividerConfig(),

                    // Display all fields
                    ...fieldValues.entries.map((entry) {
                      final fieldKey = entry.key;
                      final fieldValue = entry.value;

                      if (fieldValue == null || fieldValue.toString().isEmpty) {
                        return const SizedBox.shrink();
                      }

                      final fieldInfo = workQuantityType.quantityFields
                          .cast<QuantityField?>()
                          .firstWhere(
                            (field) =>
                                field?.uid == fieldKey ||
                                field?.code == fieldKey,
                            orElse: () => null,
                          );

                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fieldInfo?.name ?? fieldKey,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: double.infinity,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: _buildFieldValue(
                                fieldInfo,
                                fieldValue,
                                imageFields[fieldKey],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),

                    // Display image fields
                    ...imageFields.entries.map((entry) {
                      final fieldKey = entry.key;
                      final images = entry.value;

                      if (images.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      final fieldInfo = workQuantityType.quantityFields
                          .cast<QuantityField?>()
                          .firstWhere(
                            (field) =>
                                field?.uid == fieldKey ||
                                field?.code == fieldKey,
                            orElse: () => null,
                          );

                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fieldInfo?.name ?? fieldKey,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: double.infinity,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Wrap(
                                spacing: 4,
                                runSpacing: 4,
                                children: images.map((imagePath) {
                                  return Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.grey.shade100,
                                    ),
                                    child: Icon(
                                      Icons.image,
                                      size: 20,
                                      color: Colors.grey.shade500,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFieldValue(
    dynamic fieldInfo,
    dynamic fieldValue,
    List<String>? images,
  ) {
    if (images != null && images.isNotEmpty) {
      return Wrap(
        spacing: 4,
        runSpacing: 4,
        children: images.map((imagePath) {
          return Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.shade100,
            ),
            child: Icon(Icons.image, size: 20, color: Colors.grey.shade500),
          );
        }).toList(),
      );
    }

    if (fieldValue == null || fieldValue.toString().isEmpty) {
      return Text(
        'No data',
        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
      );
    }

    final unit = fieldInfo?.unit;
    if (unit != null && unit.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(fieldValue.toString(), style: TextStyle(fontSize: 13)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              unit,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      );
    } else {
      return Text(fieldValue.toString(), style: TextStyle(fontSize: 13));
    }
  }

  void _showQuantityOptions() {
    final quantityNames = widget.quantityLists
        .map((quantity) => quantity.name)
        .toList();

    if (quantityNames.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No quantities available for this work scope.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    showFlexibleBottomsheet(
      context: context,
      title: 'Select Quantity Type',
      attributes: quantityNames,
      isRadio: false,
      isNavigate: true,
      onTap: (selectedName) {
        Navigator.pop(context);
        Future.delayed(Duration(milliseconds: 100), () async {
          final selectedQuantity = widget.quantityLists.firstWhere(
            (quantity) => quantity.name == selectedName,
          );

          final existingQuantity = currentQuantities
              .where((q) => q['id'] == selectedQuantity.uid)
              .firstOrNull;

          _navigateToQuantityFields(
            selectedQuantity,
            existingQuantity?['data'],
          );
        });
      },
    );
  }
}
