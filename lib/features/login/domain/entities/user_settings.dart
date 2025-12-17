import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_settings.g.dart';

@JsonSerializable()
class UserSettings extends Equatable {
  final bool marketing;
  final bool notifications;
  final bool twoFA;

  const UserSettings({
    required this.marketing,
    required this.notifications,
    required this.twoFA,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);

  @override
  List<Object?> get props => [marketing, notifications, twoFA];
}
