import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../auth/domain/entities/auth_result.dart';
import '../../../user/domain/entities/user.dart';

part 'verify_otp_response_model.freezed.dart';
part 'verify_otp_response_model.g.dart';

@freezed
abstract class VerifyOtpResponseModel with _$VerifyOtpResponseModel {
  const VerifyOtpResponseModel._();

  const factory VerifyOtpResponseModel({
    required String accessToken,
    required String refreshToken,
    required DateTime accessTokenExpiresAt,
    required DateTime refreshTokenExpiresAt,
    required User userProfile,
  }) = _VerifyOtpResponseModel;

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseModelFromJson(json);

  /// Convert to AuthResult entity
  AuthResult toAuthResult() => AuthResult(
    accessToken: accessToken,
    refreshToken: refreshToken,
    accessTokenExpiresAt: accessTokenExpiresAt,
    refreshTokenExpiresAt: refreshTokenExpiresAt,
  );

  /// Convert to User entity (already is a User entity)
  User toUser() => userProfile;
}
