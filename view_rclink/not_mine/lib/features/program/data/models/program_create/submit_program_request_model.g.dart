// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_program_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubmitProgramRequestModel _$SubmitProgramRequestModelFromJson(
  Map<String, dynamic> json,
) => _SubmitProgramRequestModel(
  workScopeUID: json['workScopeUID'] as String,
  roads: (json['roads'] as List<dynamic>)
      .map((e) => RoadInputModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  periods: (json['periods'] as List<dynamic>)
      .map((e) => PeriodModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  contractRelationUID: json['contractRelationUID'] as String?,
  name: json['name'] as String,
  description: json['description'] as String,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  quantities: (json['quantities'] as List<dynamic>?)
      ?.map((e) => QuantityInputModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SubmitProgramRequestModelToJson(
  _SubmitProgramRequestModel instance,
) => <String, dynamic>{
  'workScopeUID': instance.workScopeUID,
  'roads': instance.roads,
  'periods': instance.periods,
  'contractRelationUID': instance.contractRelationUID,
  'name': instance.name,
  'description': instance.description,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'quantities': instance.quantities,
};

_RoadInputModel _$RoadInputModelFromJson(Map<String, dynamic> json) =>
    _RoadInputModel(
      roadUID: json['roadUID'] as String,
      fromSection: (json['fromSection'] as num?)?.toDouble(),
      toSection: (json['toSection'] as num?)?.toDouble(),
      inputValue: (json['inputValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RoadInputModelToJson(_RoadInputModel instance) =>
    <String, dynamic>{
      'roadUID': instance.roadUID,
      'fromSection': instance.fromSection,
      'toSection': instance.toSection,
      'inputValue': instance.inputValue,
    };

_PeriodModel _$PeriodModelFromJson(Map<String, dynamic> json) => _PeriodModel(
  periodStart: json['periodStart'] as String,
  periodEnd: json['periodEnd'] as String,
);

Map<String, dynamic> _$PeriodModelToJson(_PeriodModel instance) =>
    <String, dynamic>{
      'periodStart': instance.periodStart,
      'periodEnd': instance.periodEnd,
    };

_QuantityInputModel _$QuantityInputModelFromJson(
  Map<String, dynamic> json,
) => _QuantityInputModel(
  quantityTypeUID: json['quantityTypeUID'] as String,
  sequenceNo: (json['sequenceNo'] as num).toInt(),
  totalLength: (json['totalLength'] as num).toDouble(),
  notes: json['notes'] as String,
  quantityValues: (json['quantityValues'] as List<dynamic>)
      .map((e) => QuantityValueInputModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  segments: (json['segments'] as List<dynamic>)
      .map((e) => QuantitySegmentInputModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QuantityInputModelToJson(_QuantityInputModel instance) =>
    <String, dynamic>{
      'quantityTypeUID': instance.quantityTypeUID,
      'sequenceNo': instance.sequenceNo,
      'totalLength': instance.totalLength,
      'notes': instance.notes,
      'quantityValues': instance.quantityValues,
      'segments': instance.segments,
    };

_QuantityValueInputModel _$QuantityValueInputModelFromJson(
  Map<String, dynamic> json,
) => _QuantityValueInputModel(
  quantityFieldUID: json['quantityFieldUID'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$QuantityValueInputModelToJson(
  _QuantityValueInputModel instance,
) => <String, dynamic>{
  'quantityFieldUID': instance.quantityFieldUID,
  'value': instance.value,
};

_QuantitySegmentInputModel _$QuantitySegmentInputModelFromJson(
  Map<String, dynamic> json,
) => _QuantitySegmentInputModel(
  segmentNumber: (json['segmentNumber'] as num).toInt(),
  startDistance: (json['startDistance'] as num).toInt(),
  endDistance: (json['endDistance'] as num).toInt(),
  segmentValues: (json['segmentValues'] as List<dynamic>)
      .map((e) => QuantityValueInputModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QuantitySegmentInputModelToJson(
  _QuantitySegmentInputModel instance,
) => <String, dynamic>{
  'segmentNumber': instance.segmentNumber,
  'startDistance': instance.startDistance,
  'endDistance': instance.endDistance,
  'segmentValues': instance.segmentValues,
};
