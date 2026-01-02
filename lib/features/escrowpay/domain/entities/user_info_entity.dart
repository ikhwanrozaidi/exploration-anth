import 'package:json_annotation/json_annotation.dart';

part 'user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {
  final int id;
  final String email;
  final String username;

  const UserInfoEntity({
    required this.id,
    required this.email,
    required this.username,
  });

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoEntityToJson(this);

  UserInfoEntity copyWith({int? id, String? email, String? username}) {
    return UserInfoEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }
}
