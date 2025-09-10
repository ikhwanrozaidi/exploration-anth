import 'package:flutter/material.dart';
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

              // Added quantities list
              Expanded(
                child: ListView.builder(
                  itemCount: currentQuantities.length,
                  itemBuilder: (context, index) {
                    final quantity = currentQuantities[index];

                    print(quantity.toString());

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
                            child: Row(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: primaryColor,
                                          // fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // IconButton(
                                //   onPressed: () => _removeQuantity(index),
                                //   icon: Icon(
                                //     Icons.delete,
                                //     color: Colors.red.shade400,
                                //     size: 20,
                                //   ),
                                // ),
                                Icon(Icons.edit, color: primaryColor, size: 16),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
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

  void _showQuantityOptions() {
    final quantityNames = widget.scopeConfig.quantityOptions
        .map((option) => option.name)
        .toList();

    showFlexibleBottomsheet(
      context: context,
      title: 'Select Quantity Type',
      attributes: quantityNames,
      isRadio: false, // Not using radio for this case
      isNavigate: true, // Enable navigation mode
      onTap: (selectedName) {
        // Close bottomsheet first
        Navigator.pop(context);

        // Then navigate after a small delay
        Future.delayed(Duration(milliseconds: 100), () {
          final quantityOption = widget.scopeConfig.quantityOptions.firstWhere(
            (option) => option.name == selectedName,
          );

          _navigateToQuantityFields(quantityOption);
        });
      },
    );
  }

  void _navigateToQuantityFields(QuantityOption quantityOption) async {
    // Check if this quantity is already added to get existing data
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
        // Remove existing if present
        currentQuantities.removeWhere((q) => q['id'] == quantityOption.id);
        // Add new/updated data
        currentQuantities.add({
          'id': quantityOption.id,
          'name': quantityOption.name,
          'fieldsCount': quantityOption.fields.length,
          'data': result,
        });
      });
    }
  }

  void _editQuantity(Map<String, dynamic> quantity) async {
    // Find the quantity option
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
        // Find and update the existing quantity
        final index = currentQuantities.indexWhere(
          (q) => q['id'] == quantity['id'],
        );
        if (index != -1) {
          currentQuantities[index]['data'] = result;
        }
      });
    }
  }

  void _removeQuantity(int index) {
    setState(() {
      currentQuantities.removeAt(index);
    });
  }
}
