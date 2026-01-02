import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_info_entity.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

@freezed
abstract class UserInfoModel with _$UserInfoModel {
  const UserInfoModel._();

  const factory UserInfoModel({
    required int id,
    required String email,
    required String username,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  /// Convert model to entity
  UserInfoEntity toEntity() {
    return UserInfoEntity(id: id, email: email, username: username);
  }

  /// Convert entity to model
  factory UserInfoModel.fromEntity(UserInfoEntity entity) {
    return UserInfoModel(
      id: entity.id,
      email: entity.email,
      username: entity.username,
    );
  }
}
