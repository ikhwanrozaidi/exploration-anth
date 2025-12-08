// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarningListResponseModel _$WarningListResponseModelFromJson(
  Map<String, dynamic> json,
) => _WarningListResponseModel(
  statusCode: (json['statusCode'] as num).toInt(),
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => WarningModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: WarningMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WarningListResponseModelToJson(
  _WarningListResponseModel instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_WarningMetaModel _$WarningMetaModelFromJson(Map<String, dynamic> json) =>
    _WarningMetaModel(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasNext: json['hasNext'] as bool,
      hasPrev: json['hasPrev'] as bool,
    );

Map<String, dynamic> _$WarningMetaModelToJson(_WarningMetaModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'hasNext': instance.hasNext,
      'hasPrev': instance.hasPrev,
    };
