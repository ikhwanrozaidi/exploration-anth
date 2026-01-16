import 'package:json_annotation/json_annotation.dart';

part 'program_list_meta_entity.g.dart';

@JsonSerializable()
class ProgramListMeta {
  final int? page;
  final int? limit;
  final int? totalCount;
  final int? totalPages;
  final bool? hasNext;
  final bool? hasPrev;

  const ProgramListMeta({
    this.page,
    this.limit,
    this.totalCount,
    this.totalPages,
    this.hasNext,
    this.hasPrev,
  });

  factory ProgramListMeta.fromJson(Map<String, dynamic> json) =>
      _$ProgramListMetaFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramListMetaToJson(this);

  ProgramListMeta copyWith({
    int? page,
    int? limit,
    int? totalCount,
    int? totalPages,
    bool? hasNext,
    bool? hasPrev,
  }) {
    return ProgramListMeta(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      totalCount: totalCount ?? this.totalCount,
      totalPages: totalPages ?? this.totalPages,
      hasNext: hasNext ?? this.hasNext,
      hasPrev: hasPrev ?? this.hasPrev,
    );
  }
}
