import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_otp_model.freezed.dart';
part 'request_otp_model.g.dart';

@freezed
abstract class RequestOtpModel with _$RequestOtpModel {
  const factory RequestOtpModel({required String phone}) = _RequestOtpModel;

  factory RequestOtpModel.fromJson(Map<String, dynamic> json) =>
      _$RequestOtpModelFromJson(json);
}
