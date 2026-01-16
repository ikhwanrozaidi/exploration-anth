import 'package:json_annotation/json_annotation.dart';

part 'program_detail_filter_model.g.dart';

@JsonSerializable()
class ProgramDetailFilterModel {
  final List<String> expand;

  ProgramDetailFilterModel({required this.expand});

  Map<String, dynamic> toJson() => _$ProgramDetailFilterModelToJson(this);
}
