import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user_settings_entity.dart';

part 'user_settings_response_model.g.dart';

@JsonSerializable()
class UserSettingsResponseModel extends UserSettings {
  const UserSettingsResponseModel({
    required super.address,
    required super.profilePicture,
    required super.tier,
    required super.fullName,
    required super.isMarketing,
    required super.isNotifications,
    required super.isTwoFa,
  });

  factory UserSettingsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingsResponseModelToJson(this);

  factory UserSettingsResponseModel.fromEntity(UserSettings entity) {
    return UserSettingsResponseModel(
      address: entity.address,
      profilePicture: entity.profilePicture,
      tier: entity.tier,
      fullName: entity.fullName,
      isMarketing: entity.isMarketing,
      isNotifications: entity.isNotifications,
      isTwoFa: entity.isTwoFa,
    );
  }

  UserSettings toEntity() {
    return UserSettings(
      address: address,
      profilePicture: profilePicture,
      tier: tier,
      fullName: fullName,
      isMarketing: isMarketing,
      isNotifications: isNotifications,
      isTwoFa: isTwoFa,
    );
  }
}
