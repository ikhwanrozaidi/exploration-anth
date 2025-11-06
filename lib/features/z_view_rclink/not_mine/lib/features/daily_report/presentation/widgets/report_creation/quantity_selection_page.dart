import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/features/daily_report/presentation/constant/report_model.dart';
import 'package:rclink_app/features/work_scope/domain/entities/quantity_field.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_quantity_type.dart';
import 'package:rclink_app/shared/widgets/divider_config.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';

import '../../../../../core/di/injection.dart';
import '../../../../daily_report/data/mapper/hybrid_field_mapper.dart';
import '../../bloc/daily_report_create/daily_report_create_bloc.dart';
import '../../bloc/daily_report_create/daily_report_create_event.dart';
import '../../bloc/daily_report_create/daily_report_create_state.dart';
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
  // Helper method to convert BLoC quantityFieldData to display format
  List<Map<String, dynamic>> _buildQuantitiesFromBLoC(
    Map<String, Map<String, dynamic>> quantityFieldData,
  ) {
    final quantities = <Map<String, dynamic>>[];

    for (final entry in quantityFieldData.entries) {
      final compositeKey = entry.key; // Format: "quantityTypeUID_sequenceNo"
      final fieldData = entry.value;

      // Parse composite key to extract quantityTypeUID and sequenceNo
      final parts = compositeKey.split('_');
      final quantityTypeUID = parts.length >= 2
          ? parts.sublist(0, parts.length - 1).join('_') // Handle UIDs with underscores
          : compositeKey;
      final sequenceNo = parts.length >= 2
          ? int.tryParse(parts.last) ?? 1
          : 1;

      // Separate field values from image fields
      final fieldValues = <String, dynamic>{};
      final imageFields = <String, List<String>>{};

      for (final fieldEntry in fieldData.entries) {
        if (fieldEntry.key.endsWith('_images')) {
          // This is an image field
          final fieldKey = fieldEntry.key.replaceAll('_images', '');
          final images = (fieldEntry.value as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ?? [];
          if (images.isNotEmpty) {
            imageFields[fieldKey] = images;
          }
        } else {
          // This is a regular field value
          fieldValues[fieldEntry.key] = fieldEntry.value;
        }
      }

      // Find the quantity type name
      final quantityType = widget.quantityLists.firstWhere(
        (wqt) => wqt.uid == quantityTypeUID,
        orElse: () => widget.quantityLists.first,
      );

      quantities.add({
        'id': compositeKey, // Use composite key as ID
        'quantityTypeUID': quantityTypeUID, // Store actual UID separately
        'sequenceNo': sequenceNo,
        'name': sequenceNo > 1
            ? '${quantityType.name} (#$sequenceNo)' // Show sequence number if > 1
            : quantityType.name,
        'data': {
          'fieldValues': fieldValues,
          'imageFields': imageFields,
        },
      });
    }

    return quantities;
  }

  void _navigateToQuantityFields(
    WorkQuantityType selectedQuantity,
    Map<String, dynamic>? existingData,
    String compositeKey, // quantityTypeUID_sequenceNo
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

    // Get the bloc instance from dependency injection
    final bloc = getIt<DailyReportCreateBloc>();

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: bloc,
          child: QuantityFieldsPage(
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
            compositeKey: compositeKey, // Pass composite key
          ),
        ),
      ),
    );

    // Data is now in BLoC, no need to handle result
    // UI will automatically update via BlocBuilder
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyReportCreateBloc, DailyReportCreateState>(
      bloc: getIt<DailyReportCreateBloc>(),
      builder: (context, state) {
        // Get quantityFieldData from BLoC state
        final quantityFieldData = state.maybeMap(
          editingDetails: (state) => state.selections.quantityFieldData,
          orElse: () => <String, Map<String, dynamic>>{},
        );

        // Convert BLoC data to display format
        final currentQuantities = _buildQuantitiesFromBLoC(quantityFieldData);

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
                    Navigator.pop(context);
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
      },
    );
  }

  Widget _buildQuantityCard(Map<String, dynamic> quantity, int index) {
    final data = quantity['data'] as Map<String, dynamic>?;
    final fieldValues = data?['fieldValues'] as Map<String, dynamic>? ?? {};
    final imageFields =
        data?['imageFields'] as Map<String, List<String>>? ?? {};

    // Use quantityTypeUID (not the composite key 'id') to find the type
    final workQuantityType = widget.quantityLists.firstWhere(
      (wqt) => wqt.uid == quantity['quantityTypeUID'],
      orElse: () => widget.quantityLists.first,
    );

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () async {
          // quantity['id'] is the composite key
          _navigateToQuantityFields(
            workQuantityType,
            quantity['data'],
            quantity['id'], // Pass composite key for editing
          );
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

          // Get existing data from BLoC to determine next sequence number
          final bloc = getIt<DailyReportCreateBloc>();

          // Add the selected quantity type to selectedQuantityTypes
          // This is needed for the mapper to find field definitions during submission
          bloc.add(DailyReportCreateEvent.toggleQuantityType(
            selectedQuantity.uid,
          ));

          final state = bloc.state;
          final quantityFieldData = state.maybeMap(
            editingDetails: (state) => state.selections.quantityFieldData,
            orElse: () => <String, Map<String, dynamic>>{},
          );

          // Find the highest sequence number for this quantity type
          int maxSequenceNo = 0;
          for (final key in quantityFieldData.keys) {
            if (key.startsWith('${selectedQuantity.uid}_')) {
              final parts = key.split('_');
              final seqNo = int.tryParse(parts.last) ?? 0;
              if (seqNo > maxSequenceNo) {
                maxSequenceNo = seqNo;
              }
            }
          }

          // Generate next sequence number and composite key
          final nextSequenceNo = maxSequenceNo + 1;
          final compositeKey = '${selectedQuantity.uid}_$nextSequenceNo';

          // For adding new instance, no existing data
          _navigateToQuantityFields(
            selectedQuantity,
            null, // No existing data for new instance
            compositeKey,
          );
        });
      },
    );
  }
}
