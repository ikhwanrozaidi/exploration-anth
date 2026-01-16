import 'package:json_annotation/json_annotation.dart';

part '../program_create/program_list_filter_model.g.dart';

@JsonSerializable()
class ProgramListFilterModel {
  final int page;
  final int limit;
  final List<String> expand;

  ProgramListFilterModel({
    required this.page,
    required this.limit,
    required this.expand,
  });

  Map<String, dynamic> toJson() => _$ProgramListFilterModelToJson(this);
}
