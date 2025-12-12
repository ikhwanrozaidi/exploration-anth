import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_result.g.dart';

@JsonSerializable()
class AuthResult extends Equatable {
  final String accessToken;
  final String refreshToken;

  const AuthResult({required this.accessToken, required this.refreshToken});

  // Add fromJson factory
  factory AuthResult.fromJson(Map<String, dynamic> json) =>
      _$AuthResultFromJson(json);

  // Add toJson method
  Map<String, dynamic> toJson() => _$AuthResultToJson(this);

  // Add copyWith for convenience
  AuthResult copyWith({String? accessToken, String? refreshToken}) {
    return AuthResult(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
