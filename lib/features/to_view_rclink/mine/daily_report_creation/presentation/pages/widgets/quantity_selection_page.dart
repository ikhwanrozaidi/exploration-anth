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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: Text(
          'Quantity',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pop(context, currentQuantities);
          },
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
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),
                  Text(
                    '${currentQuantities.length} item(s)',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: currentQuantities.length,
                  itemBuilder: (context, index) {
                    final quantity = currentQuantities[index];
                    return Container(
                      width: 180,
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        border: Border.all(color: Colors.green.shade200),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 16,
                              ),
                              SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  quantity['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${quantity['fieldsCount']} fields completed',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            ],

            // Show bottomsheet
            // Container(
            //   margin: EdgeInsets.only(top: 20),
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // Create list of quantity option names for bottomsheet
            //       List<String> quantityNames = widget
            //           .scopeConfig
            //           .quantityOptions
            //           .map((option) => option.name)
            //           .toList();

            //       showFlexibleBottomsheet(
            //         context: context,
            //         title: "Select Quantity Type",
            //         attributes: quantityNames,
            //         isRadio: true,
            //         isNavigate: true, // Enable navigation mode
            //         onTap: (selectedValue) async {
            //           // This runs immediately when user taps a radio button
            //           print('Selected: $selectedValue');

            //           // Find the selected quantity option
            //           final selectedQuantityOption = widget
            //               .scopeConfig
            //               .quantityOptions
            //               .firstWhere((option) => option.name == selectedValue);

            //           // Check if this quantity is already added
            //           final isAdded = currentQuantities.any(
            //             (q) => q['id'] == selectedQuantityOption.id,
            //           );

            //           // Navigate to QuantityFieldsPage
            //           final result = await Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => QuantityFieldsPage(
            //                 scopeOfWork: widget.scopeOfWork,
            //                 weather: widget.weather,
            //                 location: widget.location,
            //                 section: widget.section,
            //                 quantityOption: selectedQuantityOption,
            //                 scopeConfig: widget.scopeConfig,
            //                 existingData: isAdded
            //                     ? currentQuantities.firstWhere(
            //                         (q) => q['id'] == selectedQuantityOption.id,
            //                       )['data']
            //                     : null,
            //               ),
            //             ),
            //           );

            //           // Handle the result
            //           if (result != null) {
            //             setState(() {
            //               currentQuantities.removeWhere(
            //                 (q) => q['id'] == selectedQuantityOption.id,
            //               );
            //               currentQuantities.add({
            //                 'id': selectedQuantityOption.id,
            //                 'name': selectedQuantityOption.name,
            //                 'fieldsCount': selectedQuantityOption.fields.length,
            //                 'data': result,
            //               });
            //             });
            //           }
            //         },
            //       );
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: primaryColor,
            //       padding: ResponsiveHelper.padding(context, vertical: 12),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       elevation: 2,
            //     ),
            //     child: Text(
            //       'Next',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: ResponsiveHelper.fontSize(context, base: 14),
            //       ),
            //     ),
            //   ),
            // ),

            // Available options
            Expanded(
              child: ListView.builder(
                itemCount: widget.scopeConfig.quantityOptions.length,
                itemBuilder: (context, index) {
                  final quantityOption =
                      widget.scopeConfig.quantityOptions[index];
                  final isAdded = currentQuantities.any(
                    (q) => q['id'] == quantityOption.id,
                  );

                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
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
                                existingData: isAdded
                                    ? currentQuantities.firstWhere(
                                        (q) => q['id'] == quantityOption.id,
                                      )['data']
                                    : null,
                              ),
                            ),
                          );

                          if (result != null) {
                            setState(() {
                              // Remove existing if present
                              currentQuantities.removeWhere(
                                (q) => q['id'] == quantityOption.id,
                              );
                              // Add new/updated data
                              currentQuantities.add({
                                'id': quantityOption.id,
                                'name': quantityOption.name,
                                'fieldsCount': quantityOption.fields.length,
                                'data': result,
                              });
                            });
                          }
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isAdded
                                  ? Colors.green.shade300
                                  : Colors.grey.shade300,
                              width: isAdded ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: isAdded ? Colors.green.shade50 : null,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isAdded
                                      ? Colors.green.withOpacity(0.1)
                                      : primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  isAdded ? Icons.check_circle : Icons.category,
                                  color: isAdded ? Colors.green : primaryColor,
                                  size: 24,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      quantityOption.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      isAdded
                                          ? 'Completed - Tap to edit'
                                          : '${quantityOption.fields.length} fields to fill',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isAdded
                                            ? Colors.green.shade700
                                            : Colors.grey.shade600,
                                        fontWeight: isAdded
                                            ? FontWeight.w500
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                isAdded ? Icons.edit : Icons.arrow_forward_ios,
                                color: isAdded
                                    ? Colors.green
                                    : Colors.grey.shade400,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
