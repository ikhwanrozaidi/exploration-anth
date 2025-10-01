import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../constant/report_model.dart';
import 'shared/creation_fields_widget.dart';

class QuantityFieldsPage extends StatefulWidget {
  final String scopeOfWork;
  final String weather;
  final String location;
  final String section;
  final ScopeConfig scopeConfig;

  final QuantityOption quantityOption;
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

            Expanded(
              child: Text(
                widget.quantityOption.name,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _saveData(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: ResponsiveHelper.padding(context, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Save',
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
              isTips: field.isTips ?? false,
              onSelectionChanged: (selectedValue) {
                setState(() {
                  fieldValues[fieldId] = selectedValue;
                });
              },
              onPressTips: (field.isTips == true && field.pageNavigate != null)
                  ? () {
                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => field.pageNavigate!,
                        ),
                      );
                    }
                  : null,
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
