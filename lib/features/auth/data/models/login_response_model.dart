import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gatepay_app/features/user/domain/entities/user.dart';
import '../../../user/domain/entities/user.dart';
import '../../domain/entities/auth_result.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  const LoginResponseModel._(); // Add private constructor for methods

  const factory LoginResponseModel({
    required String accessToken,
    required String refreshToken,
    required UserModel user,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  factory LoginResponseModel.fromEntity(AuthResult authResult, User user) =>
      LoginResponseModel(
        accessToken: authResult.accessToken,
        refreshToken: authResult.refreshToken,
        user: UserModel.fromEntity(user),
      );

  // Add methods directly to the class
  AuthResult toAuthResult() =>
      AuthResult(accessToken: accessToken, refreshToken: refreshToken);

  User toUser() => user.toEntity();
}

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._(); // Add private constructor for methods

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

  // Add method directly to the class
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
