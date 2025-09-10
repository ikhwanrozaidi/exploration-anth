import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../constant/report_model.dart';
import 'report_creation_fields.dart';

class QuantityFieldsPage extends StatefulWidget {
  final String scopeOfWork;
  final String weather;
  final String location;
  final String section;
  final QuantityOption quantityOption;
  final ScopeConfig scopeConfig;
  final Map<String, dynamic>? existingData;

  const QuantityFieldsPage({
    Key? key,
    required this.scopeOfWork,
    required this.weather,
    required this.location,
    required this.section,
    required this.quantityOption,
    required this.scopeConfig,
    this.existingData,
  }) : super(key: key);

  @override
  State<QuantityFieldsPage> createState() => _QuantityFieldsPageState();
}

class _QuantityFieldsPageState extends State<QuantityFieldsPage> {
  Map<String, dynamic> fieldValues = {};
  Map<String, List<String>> imageFields = {};

  @override
  void initState() {
    super.initState();
    if (widget.existingData != null) {
      fieldValues = Map.from(widget.existingData!['fieldValues'] ?? {});
      imageFields = Map<String, List<String>>.from(
        widget.existingData!['imageFields']?.map(
              (k, v) => MapEntry(k, List<String>.from(v)),
            ) ??
            {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 135, 167, 247), primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.2],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(5),
                          ),
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: primaryColor,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: ResponsiveHelper.spacing(context, 10)),
                        Expanded(
                          child: Text(
                            widget.quantityOption.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),

                              // Info header
                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: primaryColor.withOpacity(0.3),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.category, color: primaryColor),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.quantityOption.name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: primaryColor,
                                            ),
                                          ),
                                          Text(
                                            'Fill in the required fields below',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 20),

                              // Fields
                              ...widget.quantityOption.fields.map(
                                (field) => _buildField(field),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Save Button
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _saveData(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 2,
                          ),
                          child: Text(
                            'Save ${widget.quantityOption.name}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(FieldConfig field) {
    final fieldId = field.id;
    final currentValue = fieldValues[fieldId];
    final currentImages = imageFields[fieldId];

    switch (field.type) {
      case FieldType.multipleImages:
        return DailyReportCreationFields(
          focus: false,
          title: field.title,
          description: field.description,
          icon: field.icon,
          isTextField: false,
          isBottomSheet: false,
          isTextNumber: false,
          currentImages: currentImages,
          onImageAdded: (imagePath) {
            setState(() {
              final images = imageFields[fieldId] ?? [];
              imageFields[fieldId] = [...images, imagePath];
            });
          },
          onImageRemoved: (imagePath) {
            setState(() {
              final images = imageFields[fieldId] ?? [];
              images.remove(imagePath);
              imageFields[fieldId] = images;
            });
          },
        );

      case FieldType.dropdown:
        return DailyReportCreationFields(
          focus: false,
          title: field.title,
          description: field.description,
          icon: field.icon,
          isTextField: false,
          isBottomSheet: true,
          isTextNumber: false,
          currentValue: currentValue,
          onTap: () {
            showFlexibleBottomsheet(
              context: context,
              title: field.title,
              attributes: field.dropdownOptions ?? [],
              isRadio: true,
              onSelectionChanged: (selectedValue) {
                setState(() {
                  fieldValues[fieldId] = selectedValue;
                });
              },
            );
          },
        );

      case FieldType.numericField:
        return DailyReportCreationFields(
          focus: false,
          title: field.title,
          description: field.description,
          icon: field.icon,
          isTextField: true,
          isBottomSheet: false,
          isTextNumber: true,
          textFieldHintText: field.hintText,
          textFieldRange: field.numericMax,
          textFieldUnits: field.units,
          currentValue: currentValue?.toString(),
          onTextChanged: (value) {
            setState(() {
              fieldValues[fieldId] = value;
            });
          },
        );

      case FieldType.textField:
      case FieldType.notes:
        return DailyReportCreationFields(
          focus: false,
          title: field.title,
          description: field.description,
          icon: field.icon,
          isTextField: true,
          isBottomSheet: false,
          isTextNumber: false,
          textFieldHintText: field.hintText,
          currentValue: currentValue?.toString(),
          onTextChanged: (value) {
            setState(() {
              fieldValues[fieldId] = value;
            });
          },
        );
    }
  }

  void _saveData() {
    final data = {'fieldValues': fieldValues, 'imageFields': imageFields};

    Navigator.pop(context, data);
  }
}
