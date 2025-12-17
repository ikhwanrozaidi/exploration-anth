import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../user/data/models/user_model.dart';
import '../../../user/domain/entities/user.dart';
import '../../domain/entities/auth_result.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  const LoginResponseModel._();

  const factory LoginResponseModel({
    required String accessToken,
    required String refreshToken,
    required DateTime accessTokenExpiresAt,
    required DateTime refreshTokenExpiresAt,
    required UserModel user,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  factory LoginResponseModel.fromEntity(AuthResult authResult, User user) =>
      LoginResponseModel(
        accessToken: authResult.accessToken,
        refreshToken: authResult.refreshToken,
        accessTokenExpiresAt: authResult.accessTokenExpiresAt,
        refreshTokenExpiresAt: authResult.refreshTokenExpiresAt,
        user: UserModel.fromEntity(user),
      );

  // Convert model to AuthResult entity
  AuthResult toAuthResult() => AuthResult(
    accessToken: accessToken,
    refreshToken: refreshToken,
    accessTokenExpiresAt: accessTokenExpiresAt,
    refreshTokenExpiresAt: refreshTokenExpiresAt,
  );

  // Convert model to User entity
  User toUser() => user.toEntity();
}
