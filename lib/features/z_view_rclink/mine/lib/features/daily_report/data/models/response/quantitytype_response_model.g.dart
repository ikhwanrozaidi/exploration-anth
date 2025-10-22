// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantitytype_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuantityTypeResponseModel _$QuantityTypeResponseModelFromJson(
  Map<String, dynamic> json,
) => _QuantityTypeResponseModel(
  name: json['name'] as String?,
  code: json['code'] as String?,
  uid: json['uid'] as String?,
  displayOrder: (json['displayOrder'] as num?)?.toInt(),
  hasSegmentBreakdown: json['hasSegmentBreakdown'] as bool?,
  segmentSize: (json['segmentSize'] as num?)?.toDouble(),
  maxSegmentLength: (json['maxSegmentLength'] as num?)?.toDouble(),
);

Map<String, dynamic> _$QuantityTypeResponseModelToJson(
  _QuantityTypeResponseModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'code': instance.code,
  'uid': instance.uid,
  'displayOrder': instance.displayOrder,
  'hasSegmentBreakdown': instance.hasSegmentBreakdown,
  'segmentSize': instance.segmentSize,
  'maxSegmentLength': instance.maxSegmentLength,
};
