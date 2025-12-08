import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/work_scope/data/models/dropdown_option_model.dart';
import 'package:rclink_app/features/work_scope/data/models/quantity_field_model.dart';
import 'package:rclink_app/features/work_scope/data/models/work_equipment_model.dart';
import 'package:rclink_app/features/work_scope/data/models/work_quantity_type_model.dart';
import 'package:rclink_app/features/work_scope/data/models/work_scope_model.dart';
import 'package_model.dart';

part 'package_work_scope_response_model.freezed.dart';
part 'package_work_scope_response_model.g.dart';

@freezed
abstract class FlatWorkScopeModel with _$FlatWorkScopeModel {
  const factory FlatWorkScopeModel({
    required int id,
    required String uid,
    required String name,
    required String code,
    required String description,
    required bool allowMultipleQuantities,
  }) = _FlatWorkScopeModel;

  factory FlatWorkScopeModel.fromJson(Map<String, dynamic> json) =>
      _$FlatWorkScopeModelFromJson(json);
}

@freezed
abstract class FlatWorkQuantityTypeModel with _$FlatWorkQuantityTypeModel {
  const factory FlatWorkQuantityTypeModel({
    required int id,
    required String uid,
    required String name,
    required String code,
    String? description,
    required String workScopeUID,
    required int displayOrder,
    required bool hasSegmentBreakdown,
    int? segmentSize,
    int? maxSegmentLength,
  }) = _FlatWorkQuantityTypeModel;

  factory FlatWorkQuantityTypeModel.fromJson(Map<String, dynamic> json) =>
      _$FlatWorkQuantityTypeModelFromJson(json);
}

@freezed
abstract class FlatQuantityFieldModel with _$FlatQuantityFieldModel {
  const factory FlatQuantityFieldModel({
    required int id,
    required String uid,
    required String name,
    required String code,
    required String fieldType,
    String? unit,
    String? validationRules,
    required String quantityTypeUID,
    required int displayOrder,
    required bool isRequired,
    required bool isForSegment,
    String? defaultValue,
    String? placeholder,
    String? helpText,
  }) = _FlatQuantityFieldModel;

  factory FlatQuantityFieldModel.fromJson(Map<String, dynamic> json) =>
      _$FlatQuantityFieldModelFromJson(json);
}

@freezed
abstract class FlatFieldOptionModel with _$FlatFieldOptionModel {
  const factory FlatFieldOptionModel({
    required int id,
    required String uid,
    required String value,
    required String quantityFieldUID,
    required int displayOrder,
  }) = _FlatFieldOptionModel;

  factory FlatFieldOptionModel.fromJson(Map<String, dynamic> json) =>
      _$FlatFieldOptionModelFromJson(json);
}

@freezed
abstract class WorkScopeEquipmentJunctionModel
    with _$WorkScopeEquipmentJunctionModel {
  const factory WorkScopeEquipmentJunctionModel({
    required String workScopeUID,
    required String workEquipmentUID,
  }) = _WorkScopeEquipmentJunctionModel;

  factory WorkScopeEquipmentJunctionModel.fromJson(Map<String, dynamic> json) =>
      _$WorkScopeEquipmentJunctionModelFromJson(json);
}

@freezed
abstract class PackageWorkScopeJunctionModel
    with _$PackageWorkScopeJunctionModel {
  const factory PackageWorkScopeJunctionModel({
    required String uid,
    required String workScopeUID,
  }) = _PackageWorkScopeJunctionModel;

  factory PackageWorkScopeJunctionModel.fromJson(Map<String, dynamic> json) =>
      _$PackageWorkScopeJunctionModelFromJson(json);
}

@freezed
abstract class PackageWorkScopeResponseModel
    with _$PackageWorkScopeResponseModel {
  const PackageWorkScopeResponseModel._();

  const factory PackageWorkScopeResponseModel({
    required PackageModel package,
    @Default([]) List<FlatWorkScopeModel> workScopes,
    @Default([]) List<PackageWorkScopeJunctionModel> packageWorkScopes,
    @Default([]) List<FlatWorkQuantityTypeModel> quantityTypes,
    @Default([]) List<FlatQuantityFieldModel> quantityFields,
    @Default([]) List<FlatFieldOptionModel> fieldOptions,
    @Default([]) List<WorkEquipmentModel> workEquipments,
    @Default([]) List<WorkScopeEquipmentJunctionModel> workScopeEquipments,
  }) = _PackageWorkScopeResponseModel;

  factory PackageWorkScopeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PackageWorkScopeResponseModelFromJson(json);

  /// Transform flat structure to nested WorkScopeModel list
  List<WorkScopeModel> toWorkScopeModels() {
    // Get workScope UIDs that are in this package
    final packageWorkScopeUIDs = packageWorkScopes
        .map((junction) => junction.workScopeUID)
        .toSet();

    // Filter workScopes to only those in the package
    final filteredWorkScopes = workScopes
        .where((ws) => packageWorkScopeUIDs.contains(ws.uid))
        .toList();

    // Transform each workScope
    return filteredWorkScopes.map((flatWorkScope) {
      // Get quantity types for this workScope
      final workScopeQuantityTypes = _buildQuantityTypesForWorkScope(
        flatWorkScope.uid,
      );

      // Get equipments for this workScope
      final workScopeEquipmentsList = _buildEquipmentsForWorkScope(
        flatWorkScope.uid,
      );

      // Use current timestamp for missing fields
      final now = DateTime.now();

      return WorkScopeModel(
        id: flatWorkScope.id,
        uid: flatWorkScope.uid,
        name: flatWorkScope.name,
        code: flatWorkScope.code,
        description: flatWorkScope.description,
        allowMultipleQuantities: flatWorkScope.allowMultipleQuantities,
        createdAt: now, // Placeholder - missing from API
        updatedAt: now, // Placeholder - missing from API
        deletedAt: null,
        companyID: 0, // Placeholder - missing from API
        workQuantityTypes: workScopeQuantityTypes,
        workEquipments: workScopeEquipmentsList,
      );
    }).toList();
  }

  // Build quantity types for a specific workScope
  List<WorkQuantityTypeModel> _buildQuantityTypesForWorkScope(
    String workScopeUID,
  ) {
    final workScopeQuantityTypes = quantityTypes
        .where((qt) => qt.workScopeUID == workScopeUID)
        .toList();

    return workScopeQuantityTypes.map((flatQuantityType) {
      // Get quantity fields for this quantity type
      final quantityTypeFields = _buildQuantityFieldsForQuantityType(
        flatQuantityType.uid,
      );

      return WorkQuantityTypeModel(
        id: flatQuantityType.id,
        uid: flatQuantityType.uid,
        name: flatQuantityType.name,
        code: flatQuantityType.code,
        displayOrder: flatQuantityType.displayOrder,
        hasSegmentBreakdown: flatQuantityType.hasSegmentBreakdown,
        segmentSize: flatQuantityType.segmentSize,
        maxSegmentLength: flatQuantityType.maxSegmentLength,
        quantityFields: quantityTypeFields,
      );
    }).toList();
  }

  // Build quantity fields for a specific quantity type
  List<QuantityFieldModel> _buildQuantityFieldsForQuantityType(
    String quantityTypeUID,
  ) {
    final quantityTypeFields = quantityFields
        .where((qf) => qf.quantityTypeUID == quantityTypeUID)
        .toList();

    return quantityTypeFields.map((flatField) {
      // Get dropdown options for this field
      final fieldDropdownOptions = _buildDropdownOptionsForField(flatField.uid);

      return QuantityFieldModel(
        id: flatField.id,
        uid: flatField.uid,
        name: flatField.name,
        code: flatField.code,
        fieldType: flatField.fieldType,
        unit: flatField.unit,
        validationRules: flatField.validationRules,
        displayOrder: flatField.displayOrder,
        isRequired: flatField.isRequired,
        isForSegment: flatField.isForSegment,
        defaultValue: flatField.defaultValue,
        placeholder: flatField.placeholder,
        helpText: flatField.helpText,
        dropdownOptions: fieldDropdownOptions,
      );
    }).toList();
  }

  // Build dropdown options for a specific field
  List<DropdownOptionModel> _buildDropdownOptionsForField(
    String quantityFieldUID,
  ) {
    final fieldOptions = this.fieldOptions
        .where((option) => option.quantityFieldUID == quantityFieldUID)
        .toList();

    return fieldOptions
        .map(
          (flatOption) => DropdownOptionModel(
            id: flatOption.id,
            uid: flatOption.uid,
            value: flatOption.value,
            displayOrder: flatOption.displayOrder,
          ),
        )
        .toList();
  }

  // Build equipments for a specific workScope
  List<WorkEquipmentModel> _buildEquipmentsForWorkScope(String workScopeUID) {
    // Get equipment UIDs for this workScope from junction table
    final equipmentUIDs = workScopeEquipments
        .where((junction) => junction.workScopeUID == workScopeUID)
        .map((junction) => junction.workEquipmentUID)
        .toSet();

    // Get equipment models that match these UIDs
    return workEquipments
        .where((equipment) => equipmentUIDs.contains(equipment.uid))
        .toList();
  }
}
