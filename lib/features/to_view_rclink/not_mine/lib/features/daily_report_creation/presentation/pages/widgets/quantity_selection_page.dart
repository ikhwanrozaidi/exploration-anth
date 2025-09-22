import 'package:flutter/material.dart';
import 'package:rclink_app/shared/widgets/divider_config.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../constant/report_model.dart';
import 'quantity_fields_page.dart';

class QuantitySelectionPage extends StatefulWidget {
  final String scopeOfWork;
  final String weather;
  final String location;
  final String section;
  final ScopeConfig scopeConfig;
  final List<Map<String, dynamic>> addedQuantities;

  const QuantitySelectionPage({
    Key? key,
    required this.scopeOfWork,
    required this.weather,
    required this.location,
    required this.section,
    required this.scopeConfig,
    required this.addedQuantities,
  }) : super(key: key);

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
            // Current added quantities
            if (currentQuantities.isNotEmpty) ...[
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Added Quantities',
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w500,
              //         color: primaryColor,
              //       ),
              //     ),
              //     Text(
              //       '${currentQuantities.length} item(s)',
              //       style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 10),

              // Quantities View
              Expanded(
                child: ListView.builder(
                  itemCount: currentQuantities.length,
                  itemBuilder: (context, index) {
                    final quantity = currentQuantities[index];
                    return _buildQuantityCard(quantity, index);
                  },
                ),
              ),
            ] else ...[
              // Empty state
              Expanded(
                child: Center(
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
            ],

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

  // Render Summary UI for quantities
  Widget _buildQuantityCard(Map<String, dynamic> quantity, int index) {
    final data = quantity['data'] as Map<String, dynamic>?;
    final fieldValues = data?['fieldValues'] as Map<String, dynamic>? ?? {};
    final imageFields =
        data?['imageFields'] as Map<String, List<String>>? ?? {};

    final quantityOption = widget.scopeConfig.quantityOptions.firstWhere(
      (option) => option.id == quantity['id'],
    );

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () async {
          final quantityOption = widget.scopeConfig.quantityOptions.firstWhere(
            (option) => option.id == quantity['id'],
          );

          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuantityFieldsPage(
                scopeOfWork: widget.scopeOfWork,
                weather: widget.weather,
                location: widget.location,
                section: widget.section,
                quantityOption: quantityOption,
                scopeConfig: widget.scopeConfig,
                existingData: quantity['data'],
              ),
            ),
          );

          if (result != null) {
            setState(() {
              final index = currentQuantities.indexWhere(
                (q) => q['id'] == quantity['id'],
              );
              if (index != -1) {
                currentQuantities[index]['data'] = result;
              }
            });
          }
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
                      quantityOption.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),

                    dividerConfig(),

                    // Display all fields with their values
                    ...quantityOption.fields
                        .map((field) {
                          final fieldId = field.id;

                          bool hasFieldValue =
                              fieldValues.containsKey(fieldId) &&
                              fieldValues[fieldId] != null &&
                              fieldValues[fieldId].toString().isNotEmpty;

                          bool hasImageValue =
                              imageFields.containsKey(fieldId) &&
                              imageFields[fieldId]!.isNotEmpty;

                          if (!hasFieldValue && !hasImageValue) {
                            return null;
                          }

                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  field.title,
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
                                    field,
                                    fieldValues,
                                    imageFields,
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                        .where((widget) => widget != null)
                        .cast<Widget>(),
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
    FieldConfig field,
    Map<String, dynamic> fieldValues,
    Map<String, List<String>> imageFields,
  ) {
    final fieldId = field.id;

    if (field.type == FieldType.multipleImages) {
      final images = imageFields[fieldId] ?? [];
      if (images.isEmpty) {
        return Text(
          'No images',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        );
      }

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
    } else {
      final value = fieldValues[fieldId];
      if (value == null || value.toString().isEmpty) {
        return Text(
          'No data',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        );
      }

      // Check if field has units
      if (field.units != null && field.units!.isNotEmpty) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value.toString(), style: TextStyle(fontSize: 13)),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                field.units!,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        );
      } else {
        return Text(value.toString(), style: TextStyle(fontSize: 13));
      }
    }
  }

  // Open bottomsheet
  void _showQuantityOptions() {
    final quantityNames = widget.scopeConfig.quantityOptions
        .map((option) => option.name)
        .toList();

    showFlexibleBottomsheet(
      context: context,
      title: 'Select Quantity Type',
      attributes: quantityNames,
      isRadio: false,
      isNavigate: true,
      onTap: (selectedName) {
        Navigator.pop(context);
        Future.delayed(Duration(milliseconds: 100), () async {
          final quantityOption = widget.scopeConfig.quantityOptions.firstWhere(
            (option) => option.name == selectedName,
          );
          final existingQuantity = currentQuantities
              .where((q) => q['id'] == quantityOption.id)
              .firstOrNull;

          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuantityFieldsPage(
                scopeOfWork: widget.scopeOfWork,
                weather: widget.weather,
                location: widget.location,
                section: widget.section,
                quantityOption: quantityOption,
                scopeConfig: widget.scopeConfig,
                existingData: existingQuantity?['data'],
              ),
            ),
          );

          if (result != null) {
            setState(() {
              currentQuantities.removeWhere(
                (q) => q['id'] == quantityOption.id,
              );
              currentQuantities.add({
                'id': quantityOption.id,
                'name': quantityOption.name,
                'fieldsCount': quantityOption.fields.length,
                'data': result,
              });
            });
          }
        });
      },
    );
  }
}
