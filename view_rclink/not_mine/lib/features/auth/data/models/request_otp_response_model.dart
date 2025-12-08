import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/otp_response.dart';

part 'request_otp_response_model.freezed.dart';
part 'request_otp_response_model.g.dart';

@freezed
abstract class RequestOtpResponseModel with _$RequestOtpResponseModel {
  const RequestOtpResponseModel._();

  const factory RequestOtpResponseModel({required String message}) =
      _RequestOtpResponseModel;

  factory RequestOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RequestOtpResponseModelFromJson(json);

  factory RequestOtpResponseModel.fromEntity(OtpResponse entity) =>
      RequestOtpResponseModel(message: entity.message);
  
  OtpResponse toEntity() => OtpResponse(message: message);
}
