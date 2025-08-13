import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/auth_result.dart';
import '../../domain/entities/otp_response.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.otpSent(OtpResponse data) = AuthOtpSent;
  const factory AuthState.authenticated(AuthResult authResult) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.failure(String message) = AuthFailure;
}
