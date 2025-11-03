import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/features/daily_report/presentation/constant/report_model.dart';
import 'package:rclink_app/features/work_scope/domain/entities/quantity_field.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../bloc/daily_report_create/daily_report_create_bloc.dart';
import '../../bloc/daily_report_create/daily_report_create_event.dart';
import '../../bloc/daily_report_create/daily_report_create_state.dart';
import 'quantity_segments_breakdown_page.dart';
import 'shared/creation_fields_widget.dart';

class QuantityFieldsPage extends StatefulWidget {
  final String scopeOfWork;
  final String weather;
  final String location;
  final String section;
  final ScopeConfig scopeConfig;

  final QuantityOption quantityOption;
  final Map<String, dynamic>? existingData;

  final bool hasSegmentBreakdown;
  final String? selectedScopeUid;
  final int? segmentSize;
  final int? maxSegmentLength;
  final List<QuantityField>? segmentFields;
  final List<QuantityField>? allQuantityFields;

  // Composite key for supporting multiple instances (quantityTypeUID_sequenceNo)
  final String compositeKey;

  const QuantityFieldsPage({
    Key? key,
    required this.scopeOfWork,
    required this.weather,
    required this.location,
    required this.section,
    required this.scopeConfig,

    required this.quantityOption,
    this.existingData,

    this.hasSegmentBreakdown = false,
    this.selectedScopeUid,
    this.segmentSize,
    this.maxSegmentLength,
    this.segmentFields,
    this.allQuantityFields,
    required this.compositeKey,
  }) : super(key: key);

  @override
  State<QuantityFieldsPage> createState() => _QuantityFieldsPageState();
}

class _QuantityFieldsPageState extends State<QuantityFieldsPage> {
  // Get the composite key for this quantity instance (quantityTypeUID_sequenceNo)
  String get quantityTypeUID => widget.compositeKey;

  @override
  void initState() {
    super.initState();

    // Load existing data into BLoC if provided
    if (widget.existingData != null) {
      final fieldValues = widget.existingData!['fieldValues'] ?? {};
      final imageFields = widget.existingData!['imageFields'] ?? {};

      // Dispatch events to populate BLoC state with existing data
      fieldValues.forEach((key, value) {
        context.read<DailyReportCreateBloc>().add(
          DailyReportCreateEvent.updateQuantityFieldValue(
            quantityTypeUID: quantityTypeUID,
            fieldKey: key,
            value: value,
          ),
        );
      });

      imageFields.forEach((key, images) {
        context.read<DailyReportCreateBloc>().add(
          DailyReportCreateEvent.updateQuantityFieldImages(
            quantityTypeUID: quantityTypeUID,
            fieldKey: key,
            images: List<String>.from(images),
          ),
        );
      });
    }
  }

  // Helper to get current field data from BLoC
  Map<String, dynamic> _getFieldData(DailyReportCreateState state) {
    return state.maybeMap(
      editingDetails: (state) =>
          state.selections.quantityFieldData[quantityTypeUID] ?? {},
      orElse: () => {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyReportCreateBloc, DailyReportCreateState>(
      builder: (context, state) {
        final fieldData = _getFieldData(state);

        return PopScope(
          canPop: true, // Data already auto-saved to BLoC, safe to navigate
          child: Scaffold(
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
        padding: ResponsiveHelper.padding(
          context,
          vertical: 25,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.quantityOption.fields
                      .map((field) => _buildField(field, fieldData))
                      .toList(),
                ),
              ),
            ),

            // Continue Button (data auto-saved to BLoC)
            SizedBox(height: 20),

            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _navigateNext(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: ResponsiveHelper.padding(context, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Continue',
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
          ),
        );
      },
    );
  }

  Widget _buildField(FieldConfig field, Map<String, dynamic> fieldData) {
    final fieldId = field.id;
    final currentValue = fieldData[fieldId];
    final currentImages = fieldData['${fieldId}_images'] as List<dynamic>?;
    final imageList = currentImages?.cast<String>().toList();

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
          currentImages: imageList,
          onImageAdded: (imagePath) {
            final images = imageList ?? [];
            context.read<DailyReportCreateBloc>().add(
              DailyReportCreateEvent.updateQuantityFieldImages(
                quantityTypeUID: quantityTypeUID,
                fieldKey: fieldId,
                images: [...images, imagePath],
              ),
            );
          },
          onImageRemoved: (imagePath) {
            final images = imageList ?? [];
            final updatedImages = images.where((img) => img != imagePath).toList();
            context.read<DailyReportCreateBloc>().add(
              DailyReportCreateEvent.updateQuantityFieldImages(
                quantityTypeUID: quantityTypeUID,
                fieldKey: fieldId,
                images: updatedImages,
              ),
            );
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
                context.read<DailyReportCreateBloc>().add(
                  DailyReportCreateEvent.updateQuantityFieldValue(
                    quantityTypeUID: quantityTypeUID,
                    fieldKey: fieldId,
                    value: selectedValue,
                  ),
                );
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
            context.read<DailyReportCreateBloc>().add(
              DailyReportCreateEvent.updateQuantityFieldValue(
                quantityTypeUID: quantityTypeUID,
                fieldKey: fieldId,
                value: value,
              ),
            );
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
            context.read<DailyReportCreateBloc>().add(
              DailyReportCreateEvent.updateQuantityFieldValue(
                quantityTypeUID: quantityTypeUID,
                fieldKey: fieldId,
                value: value,
              ),
            );
          },
        );
    }
  }

  void _navigateNext() {
    // Data already saved to BLoC via incremental updates, just handle navigation

    // Check BOTH conditions:
    // 1. selectedScopeUid == Road Shoulder (R02)
    // 2. hasSegmentBreakdown == true
    final shouldShowSegmentBreakdown =
        widget.selectedScopeUid == '81094b15-03b7-4648-bc35-1fd214c90031' &&
        widget.hasSegmentBreakdown;

    if (shouldShowSegmentBreakdown) {
      // Get the bloc instance from dependency injection
      final bloc = getIt<DailyReportCreateBloc>();

      // Navigate to Segment Breakdown Page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: bloc,
            child: QuantitySegmentBreakdownPage(
              quantityTypeUID: quantityTypeUID,
              quantityName: widget.quantityOption.name,
              segmentSize: widget.segmentSize ?? 25,
              maxSegmentLength: widget.maxSegmentLength ?? 1000,
              segmentFields: widget.segmentFields ?? [],
              allQuantityFields: widget.allQuantityFields ?? [],
            ),
          ),
        ),
      );
    } else {
      // Normal flow: pop back WITHOUT data (data already in BLoC)
      Navigator.pop(context);
    }
  }
}
