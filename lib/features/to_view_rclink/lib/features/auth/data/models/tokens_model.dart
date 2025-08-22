import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/tokens.dart';

part 'tokens_model.freezed.dart';
part 'tokens_model.g.dart';

@freezed
abstract class TokensModel with _$TokensModel {
  const TokensModel._();

  const factory TokensModel({
    required String accessToken,
    required String refreshToken,
    required DateTime accessTokenExpiresAt,
    required DateTime refreshTokenExpiresAt,
  }) = _TokensModel;

  factory TokensModel.fromJson(Map<String, dynamic> json) =>
      _$TokensModelFromJson(json);

  // Convert model to entity
  Tokens toEntity() {
    return Tokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      accessTokenExpiresAt: accessTokenExpiresAt,
      refreshTokenExpiresAt: refreshTokenExpiresAt,
    );
  }

  // Create model from entity
  factory TokensModel.fromEntity(Tokens entity) {
    return TokensModel(
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
      accessTokenExpiresAt: entity.accessTokenExpiresAt,
      refreshTokenExpiresAt: entity.refreshTokenExpiresAt,
    );
  }
}
