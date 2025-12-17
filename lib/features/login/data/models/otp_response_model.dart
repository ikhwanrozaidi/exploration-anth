import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_response_model.freezed.dart';
part 'otp_response_model.g.dart';

@freezed
abstract class OtpResponseModel with _$OtpResponseModel {
  const factory OtpResponseModel({
    required String message,
    required String sentTo,
    required String email,
  }) = _OtpResponseModel;

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseModelFromJson(json);
}
