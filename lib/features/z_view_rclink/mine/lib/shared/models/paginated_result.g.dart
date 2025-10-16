// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResult<T> _$PaginatedResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginatedResult<T>(
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  hasNext: json['hasNext'] as bool,
  hasPrevious: json['hasPrevious'] as bool,
);

Map<String, dynamic> _$PaginatedResultToJson<T>(
  PaginatedResult<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'total': instance.total,
  'page': instance.page,
  'limit': instance.limit,
  'totalPages': instance.totalPages,
  'hasNext': instance.hasNext,
  'hasPrevious': instance.hasPrevious,
};
