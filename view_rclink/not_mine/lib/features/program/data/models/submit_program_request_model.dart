import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_program_request_model.freezed.dart';
part 'submit_program_request_model.g.dart';

@freezed
abstract class SubmitProgramRequestModel with _$SubmitProgramRequestModel {
  const factory SubmitProgramRequestModel({
    required String workScopeUID,
    required List<RoadInputModel> roads,
    required List<PeriodModel> periods,
    String? contractRelationUID,
    required String name,
    required String description,
    double? latitude,
    double? longitude,
    List<QuantityInputModel>? quantities,
  }) = _SubmitProgramRequestModel;

  factory SubmitProgramRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SubmitProgramRequestModelFromJson(json);
}

@freezed
abstract class RoadInputModel with _$RoadInputModel {
  const factory RoadInputModel({
    required String roadUID,
    required double fromSection,
    double? toSection,
    int? inputValue,
  }) = _RoadInputModel;

  factory RoadInputModel.fromJson(Map<String, dynamic> json) =>
      _$RoadInputModelFromJson(json);
}

@freezed
abstract class PeriodModel with _$PeriodModel {
  const factory PeriodModel({
    required String periodStart,
    required String periodEnd,
  }) = _PeriodModel;

  factory PeriodModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodModelFromJson(json);
}

@freezed
abstract class QuantityInputModel with _$QuantityInputModel {
  const factory QuantityInputModel({
    required String quantityTypeUID,
    required int sequenceNo,
    required double totalLength,
    required String notes,
    required List<QuantityValueInputModel> quantityValues,
    required List<QuantitySegmentInputModel> segments,
  }) = _QuantityInputModel;

  factory QuantityInputModel.fromJson(Map<String, dynamic> json) =>
      _$QuantityInputModelFromJson(json);
}

@freezed
abstract class QuantityValueInputModel with _$QuantityValueInputModel {
  const factory QuantityValueInputModel({
    required String quantityFieldUID,
    required String value,
  }) = _QuantityValueInputModel;

  factory QuantityValueInputModel.fromJson(Map<String, dynamic> json) =>
      _$QuantityValueInputModelFromJson(json);
}

@freezed
abstract class QuantitySegmentInputModel with _$QuantitySegmentInputModel {
  const factory QuantitySegmentInputModel({
    required int segmentNumber,
    required int startDistance,
    required int endDistance,
    required List<QuantityValueInputModel> segmentValues,
  }) = _QuantitySegmentInputModel;

  factory QuantitySegmentInputModel.fromJson(Map<String, dynamic> json) =>
      _$QuantitySegmentInputModelFromJson(json);
}
