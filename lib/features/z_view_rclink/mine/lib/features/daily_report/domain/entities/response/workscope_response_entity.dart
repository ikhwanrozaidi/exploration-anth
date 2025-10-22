import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workscope_response_entity.g.dart';

@JsonSerializable()
class WorkScopeResponse extends Equatable {
  final String? name;
  final String? code;
  final String? uid;

  const WorkScopeResponse({this.name, this.code, this.uid});

  factory WorkScopeResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkScopeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WorkScopeResponseToJson(this);

  WorkScopeResponse copyWith({String? name, String? code, String? uid}) {
    return WorkScopeResponse(
      name: name ?? this.name,
      code: code ?? this.code,
      uid: uid ?? this.uid,
    );
  }

  @override
  List<Object?> get props => [name, code, uid];
}
