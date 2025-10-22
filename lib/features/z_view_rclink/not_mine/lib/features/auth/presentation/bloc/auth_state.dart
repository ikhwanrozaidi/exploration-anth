import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/auth/domain/entities/otp_response.dart';
import '../../domain/entities/tokens.dart';
import '../../../admin/domain/entities/admin.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.otpSent(OtpResponse data) = AuthOtpSent;
  const factory AuthState.authenticated(
    Tokens tokens, {
    Admin? currentAdmin,
  }) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.failure(String message) = AuthFailure;
}
