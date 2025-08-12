// lib/features/auth/data/models/signup_request_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_request_model.freezed.dart';
part 'signup_request_model.g.dart';

@freezed
abstract class SignUpRequestModel with _$SignUpRequestModel {
  const factory SignUpRequestModel({
    required String email,
    required String password,
    required Map<String, dynamic> additionalData,
  }) = _SignUpRequestModel;

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);
}