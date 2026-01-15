import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_program_event.freezed.dart';

@freezed
abstract class CreateProgramEvent with _$CreateProgramEvent {
  const factory CreateProgramEvent.submitR02Program({
    required String companyUID,
    required String workScopeUID,
    required String workScopeCode,
    required String workScopeName,
    required String roadUID,
    required double section,
    required List<Map<String, String>> periods,
    required DateTime periodStart,
    String? contractRelationUID,
    required String description,
    double? latitude,
    double? longitude,
    required Map<String, Map<String, dynamic>> quantityFieldData,
    required List<dynamic> quantityTypes, // QuantityTypeNested list
  }) = SubmitR02Program;

  const factory CreateProgramEvent.submitNonR02Program({
    required String companyUID,
    required String workScopeUID,
    required String workScopeCode,
    required String workScopeName,
    required List<Map<String, dynamic>> selectedRoads,
    required List<Map<String, String>> periods,
    required DateTime periodStart,
    String? contractRelationUID,
  }) = SubmitNonR02Program;
}
