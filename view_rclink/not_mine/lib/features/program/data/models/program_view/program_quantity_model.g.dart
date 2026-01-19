// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_quantity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramQuantityModel _$ProgramQuantityModelFromJson(
  Map<String, dynamic> json,
) => _ProgramQuantityModel(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  programID: (json['programID'] as num?)?.toInt(),
  quantityTypeID: (json['quantityTypeID'] as num?)?.toInt(),
  sequenceNo: (json['sequenceNo'] as num?)?.toInt(),
  totalLength: json['totalLength'] as String?,
  notes: json['notes'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  quantityType: json['quantityType'] == null
      ? null
      : QuantityTypeNestedModel.fromJson(
          json['quantityType'] as Map<String, dynamic>,
        ),
  quantityValues: (json['quantityValues'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
  segments: (json['segments'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$ProgramQuantityModelToJson(
  _ProgramQuantityModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'programID': instance.programID,
  'quantityTypeID': instance.quantityTypeID,
  'sequenceNo': instance.sequenceNo,
  'totalLength': instance.totalLength,
  'notes': instance.notes,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'quantityType': instance.quantityType,
  'quantityValues': instance.quantityValues,
  'segments': instance.segments,
};
