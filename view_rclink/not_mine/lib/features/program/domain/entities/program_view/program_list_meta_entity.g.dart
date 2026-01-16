// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_list_meta_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramListMeta _$ProgramListMetaFromJson(Map<String, dynamic> json) =>
    ProgramListMeta(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      hasNext: json['hasNext'] as bool?,
      hasPrev: json['hasPrev'] as bool?,
    );

Map<String, dynamic> _$ProgramListMetaToJson(ProgramListMeta instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'hasNext': instance.hasNext,
      'hasPrev': instance.hasPrev,
    };
