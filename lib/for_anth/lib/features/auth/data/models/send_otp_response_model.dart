import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/otp_response.dart';

part 'send_otp_response_model.freezed.dart';
part 'send_otp_response_model.g.dart';

@freezed
abstract class SendOtpResponseModel with _$SendOtpResponseModel {
  const factory SendOtpResponseModel({
    required String message,
    required bool success,
  }) = _SendOtpResponseModel;

  factory SendOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SendOtpResponseModelFromJson(json);

  factory SendOtpResponseModel.fromEntity(OtpResponse entity) =>
      SendOtpResponseModel(message: entity.message, success: entity.success);
}

extension SendOtpResponseModelX on SendOtpResponseModel {
  OtpResponse toEntity() => OtpResponse(message: message, success: success);
}
