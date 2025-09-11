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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Added Quantities',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    '${currentQuantities.length} item(s)',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Added quantities list with detailed view
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

  Widget _buildQuantityCard(Map<String, dynamic> quantity, int index) {
    final data = quantity['data'] as Map<String, dynamic>?;

    final fieldValues = data?['fieldValues'] as Map<String, dynamic>? ?? {};
    final imageFields =
        data?['imageFields'] as Map<String, List<String>>? ?? {};

    String summary = _generateSummary(fieldValues, imageFields);

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _editQuantity(quantity),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 2),
              borderRadius: BorderRadius.circular(12),
              color: primaryShade,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: primaryColor,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quantity['name'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Completed - Tap to edit',
                            style: TextStyle(fontSize: 14, color: primaryColor),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.edit, color: primaryColor, size: 16),
                  ],
                ),

                // Summary section
                if (summary.isNotEmpty) ...[
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Filled Data:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          summary,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],

                // Summary mine
                if (summary.isNotEmpty) ...[
                  SizedBox(height: 12),

                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),

                        dividerConfig(),

                        Text(
                          'Key 1',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text('Value 1'),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'Key 2',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text('Value 2'),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _generateSummary(
    Map<String, dynamic> fieldValues,
    Map<String, List<String>> imageFields,
  ) {
    List<String> summaryItems = [];

    // Add field values summary
    fieldValues.forEach((key, value) {
      if (value != null && value.toString().isNotEmpty) {
        summaryItems.add('$key: $value');
      }
    });

    // Add image fields summary
    imageFields.forEach((key, images) {
      if (images.isNotEmpty) {
        summaryItems.add('$key: ${images.length} image(s)');
      }
    });

    return summaryItems.isEmpty
        ? 'No data filled yet'
        : summaryItems.join(', ');
  }

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

  void _editQuantity(Map<String, dynamic> quantity) async {
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
  }
}
