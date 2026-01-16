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
      ?.map(
        (e) => ProgramQuantityValueModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  segments: (json['segments'] as List<dynamic>?)
      ?.map(
        (e) => ProgramQuantitySegmentModel.fromJson(e as Map<String, dynamic>),
      )
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

_ProgramQuantityValueModel _$ProgramQuantityValueModelFromJson(
  Map<String, dynamic> json,
) => _ProgramQuantityValueModel(
  id: (json['id'] as num?)?.toInt(),
  programQuantityID: (json['programQuantityID'] as num?)?.toInt(),
  segmentID: (json['segmentID'] as num?)?.toInt(),
  quantityFieldID: (json['quantityFieldID'] as num?)?.toInt(),
  value: json['value'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  quantityField: json['quantityField'] == null
      ? null
      : QuantityFieldNestedModel.fromJson(
          json['quantityField'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ProgramQuantityValueModelToJson(
  _ProgramQuantityValueModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'programQuantityID': instance.programQuantityID,
  'segmentID': instance.segmentID,
  'quantityFieldID': instance.quantityFieldID,
  'value': instance.value,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'quantityField': instance.quantityField,
};

_ProgramQuantitySegmentModel _$ProgramQuantitySegmentModelFromJson(
  Map<String, dynamic> json,
) => _ProgramQuantitySegmentModel(
  id: (json['id'] as num?)?.toInt(),
  programQuantityID: (json['programQuantityID'] as num?)?.toInt(),
  segmentNumber: (json['segmentNumber'] as num?)?.toInt(),
  startDistance: json['startDistance'] as String?,
  endDistance: json['endDistance'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  segmentValues: (json['segmentValues'] as List<dynamic>?)
      ?.map(
        (e) => ProgramQuantityValueModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$ProgramQuantitySegmentModelToJson(
  _ProgramQuantitySegmentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'programQuantityID': instance.programQuantityID,
  'segmentNumber': instance.segmentNumber,
  'startDistance': instance.startDistance,
  'endDistance': instance.endDistance,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'segmentValues': instance.segmentValues,
};
