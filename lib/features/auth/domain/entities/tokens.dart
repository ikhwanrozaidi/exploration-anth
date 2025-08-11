import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tokens.g.dart';

@JsonSerializable()
class Tokens extends Equatable {
  @JsonKey(name: 'accessToken')
  final String accessToken;
  
  @JsonKey(name: 'refreshToken')
  final String refreshToken;
  
  @JsonKey(name: 'accessTokenExpiresAt')
  final DateTime accessTokenExpiresAt;
  
  @JsonKey(name: 'refreshTokenExpiresAt')
  final DateTime refreshTokenExpiresAt;

  const Tokens({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiresAt,
    required this.refreshTokenExpiresAt,
  });

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
        accessTokenExpiresAt,
        refreshTokenExpiresAt,
      ];

  Tokens copyWith({
    String? accessToken,
    String? refreshToken,
    DateTime? accessTokenExpiresAt,
    DateTime? refreshTokenExpiresAt,
  }) {
    return Tokens(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      accessTokenExpiresAt:
          accessTokenExpiresAt ?? this.accessTokenExpiresAt,
      refreshTokenExpiresAt:
          refreshTokenExpiresAt ?? this.refreshTokenExpiresAt,
    );
  }

  factory Tokens.fromJson(Map<String, dynamic> json) =>
      _$TokensFromJson(json);
  Map<String, dynamic> toJson() => _$TokensToJson(this);
}