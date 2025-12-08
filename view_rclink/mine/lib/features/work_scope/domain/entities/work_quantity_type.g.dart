// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_quantity_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkQuantityType _$WorkQuantityTypeFromJson(Map<String, dynamic> json) =>
    WorkQuantityType(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      displayOrder: (json['displayOrder'] as num).toInt(),
      hasSegmentBreakdown: json['hasSegmentBreakdown'] as bool,
      segmentSize: (json['segmentSize'] as num?)?.toInt(),
      maxSegmentLength: (json['maxSegmentLength'] as num?)?.toInt(),
      quantityFields: (json['quantityFields'] as List<dynamic>)
          .map((e) => QuantityField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkQuantityTypeToJson(WorkQuantityType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'code': instance.code,
      'displayOrder': instance.displayOrder,
      'hasSegmentBreakdown': instance.hasSegmentBreakdown,
      'segmentSize': instance.segmentSize,
      'maxSegmentLength': instance.maxSegmentLength,
      'quantityFields': instance.quantityFields,
    };
