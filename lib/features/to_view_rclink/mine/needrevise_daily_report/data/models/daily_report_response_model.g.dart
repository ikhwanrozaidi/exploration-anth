// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyReportResponseModel _$DailyReportResponseModelFromJson(
  Map<String, dynamic> json,
) => _DailyReportResponseModel(
  statusCode: (json['statusCode'] as num).toInt(),
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => DailyReportModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: DailyReportMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DailyReportResponseModelToJson(
  _DailyReportResponseModel instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_DailyReportMetaModel _$DailyReportMetaModelFromJson(
  Map<String, dynamic> json,
) => _DailyReportMetaModel(
  page: (json['page'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  totalCount: (json['totalCount'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  hasNext: json['hasNext'] as bool,
  hasPrev: json['hasPrev'] as bool,
);

Map<String, dynamic> _$DailyReportMetaModelToJson(
  _DailyReportMetaModel instance,
) => <String, dynamic>{
  'page': instance.page,
  'limit': instance.limit,
  'totalCount': instance.totalCount,
  'totalPages': instance.totalPages,
  'hasNext': instance.hasNext,
  'hasPrev': instance.hasPrev,
};
