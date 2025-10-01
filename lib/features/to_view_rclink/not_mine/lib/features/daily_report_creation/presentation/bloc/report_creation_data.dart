import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/scope_of_work/scope_of_work.dart';
import '../../domain/entities/scope_of_work/work_equipment.dart';
import '../../domain/entities/scope_of_work/work_quantity_type.dart';
import '../../domain/entities/province/province_entity.dart';
import '../../domain/entities/province/district_entity.dart';
import '../../domain/entities/province/road_entity.dart';

part 'report_creation_data.freezed.dart';

// All of Report Data
@freezed
abstract class ReportData with _$ReportData {
  const factory ReportData({
    required ReportApiData apiData,
    required ReportSelections selections,
    required ReportFormData formData,
  }) = _ReportData;
}

// Data from API
@freezed
abstract class ReportApiData with _$ReportApiData {
  const factory ReportApiData({
    List<ScopeOfWork>? workScopes,
    List<Province>? states,
    List<District>? districts,
    List<Road>? roads,
    List<WorkQuantityType>? quantities,
    List<WorkEquipment>? equipment,
  }) = _ReportApiData;
}

// User Selections
@freezed
abstract class ReportSelections with _$ReportSelections {
  const factory ReportSelections({
    String? selectedScopeUid,
    ScopeOfWork? selectedScope,
    String? selectedWeather,
    String? selectedStateUid,
    Province? selectedState,
    String? selectedDistrictUid,
    District? selectedDistrict,
    String? selectedRoadUid,
    Road? selectedRoad,
    String? section,
    String? sectionError,
    @Default([]) List<String> selectedQuantityTypeUids,
    @Default([]) List<WorkQuantityType> selectedQuantityTypes,
    @Default([]) List<String> selectedEquipmentUids,
    @Default([]) List<WorkEquipment> selectedEquipment,
    @Default({}) Map<String, List<Map<String, dynamic>>> conditionSnapshots,
    @Default([]) List<Map<String, dynamic>> workerImages,
  }) = _ReportSelections;
}

@freezed
abstract class ReportFormData with _$ReportFormData {
  const factory ReportFormData({
    @Default({}) Map<String, dynamic> fieldValues,
    @Default({}) Map<String, List<String>> imageFields,
    @Default({}) Map<String, String?> fieldErrors,
    @Default([]) List<String> validationErrors,
    @Default(false) bool isFormValid,
  }) = _ReportFormData;
}
