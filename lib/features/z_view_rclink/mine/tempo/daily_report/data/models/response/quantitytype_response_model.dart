import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/daily_report/domain/entities/response/quantitytype_response_entity.dart';

part 'quantitytype_response_model.freezed.dart';
part 'quantitytype_response_model.g.dart';

@freezed
abstract class QuantityTypeResponseModel with _$QuantityTypeResponseModel {
  const QuantityTypeResponseModel._();

  const factory QuantityTypeResponseModel({
    String? name,
    String? code,
    String? uid,
    int? displayOrder,
    bool? hasSegmentBreakdown,
    double? segmentSize,
    double? maxSegmentLength,
  }) = _QuantityTypeResponseModel;

  factory QuantityTypeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuantityTypeResponseModelFromJson(json);

  QuantityTypeResponse toEntity() {
    return QuantityTypeResponse(
      name: name,
      code: code,
      uid: uid,
      displayOrder: displayOrder,
      hasSegmentBreakdown: hasSegmentBreakdown,
      segmentSize: segmentSize,
      maxSegmentLength: maxSegmentLength,
    );
  }

  factory QuantityTypeResponseModel.fromEntity(QuantityTypeResponse entity) {
    return QuantityTypeResponseModel(
      name: entity.name,
      code: entity.code,
      uid: entity.uid,
      displayOrder: entity.displayOrder,
      hasSegmentBreakdown: entity.hasSegmentBreakdown,
      segmentSize: entity.segmentSize,
      maxSegmentLength: entity.maxSegmentLength,
    );
  }
}
