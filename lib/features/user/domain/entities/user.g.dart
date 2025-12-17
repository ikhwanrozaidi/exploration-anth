// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  role: json['role'] as String,
  phone: json['phone'] as String,
  status: json['status'] as String,
  balance: json['balance'] as String,
  merchantId: json['merchantId'] as String?,
  country: json['country'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  userDetail: json['userDetail'] == null
      ? null
      : UserDetail.fromJson(json['userDetail'] as Map<String, dynamic>),
  userSettings: json['userSettings'] == null
      ? null
      : UserSettings.fromJson(json['userSettings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'role': instance.role,
  'phone': instance.phone,
  'status': instance.status,
  'balance': instance.balance,
  'merchantId': instance.merchantId,
  'country': instance.country,
  'createdAt': instance.createdAt.toIso8601String(),
  'userDetail': instance.userDetail,
  'userSettings': instance.userSettings,
};

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  fullName: json['fullName'] as String,
  address: json['address'] as String,
  birthDate: json['birthDate'] as String,
  profilePicture: json['profilePicture'] as String,
  gatePoint: (json['gatePoint'] as num).toInt(),
  verify: json['verify'] as bool,
  vaccount: json['vaccount'] as String,
);

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'address': instance.address,
      'birthDate': instance.birthDate,
      'profilePicture': instance.profilePicture,
      'gatePoint': instance.gatePoint,
      'verify': instance.verify,
      'vaccount': instance.vaccount,
    };

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) => UserSettings(
  marketing: json['marketing'] as bool,
  notifications: json['notifications'] as bool,
  twoFA: json['twoFA'] as bool,
);

Map<String, dynamic> _$UserSettingsToJson(UserSettings instance) =>
    <String, dynamic>{
      'marketing': instance.marketing,
      'notifications': instance.notifications,
      'twoFA': instance.twoFA,
    };
