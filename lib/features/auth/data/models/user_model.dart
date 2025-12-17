import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user/domain/entities/user.dart';
import '../../domain/entities/auth_result.dart';

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

  factory UserModel.fromEntity(User user) => UserModel(
    id: user.id,
    uid: user.uid,
    firstName: user.firstName,
    lastName: user.lastName,
    email: user.email,
    phone: user.phone,
    updatedAt: user.updatedAt,
    createdAt: user.createdAt,
  );

  User toEntity() => User(
    id: id,
    uid: uid,
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone,
    updatedAt: updatedAt,
    createdAt: createdAt,
  );
}
