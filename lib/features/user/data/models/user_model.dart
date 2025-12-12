import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required int id,
    required String uid,
    required String phone,
    String? firstName,
    String? lastName,
    String? email,
    required DateTime updatedAt,
    required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Convert to entity
  User toEntity() => User(
    id: id,
    uid: uid,
    phone: phone,
    firstName: firstName,
    lastName: lastName,
    email: email,
    updatedAt: updatedAt,
    createdAt: createdAt,
  );

  // Create from entity
  factory UserModel.fromEntity(User entity) => UserModel(
    id: entity.id,
    uid: entity.uid,
    phone: entity.phone,
    firstName: entity.firstName,
    lastName: entity.lastName,
    email: entity.email,
    updatedAt: entity.updatedAt,
    createdAt: entity.createdAt,
  );
}
