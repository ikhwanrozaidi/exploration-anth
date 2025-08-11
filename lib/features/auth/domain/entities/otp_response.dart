import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_response.g.dart';

@JsonSerializable()
class OtpResponse extends Equatable {
  final String message;

  const OtpResponse({required this.message});

  @override
  List<Object?> get props => [message];

  factory OtpResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OtpResponseToJson(this);
}
