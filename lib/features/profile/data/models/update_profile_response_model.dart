import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/entities/user_profile_user.dart';
import '../../domain/entities/user_profile_detail.dart';
import 'user_detail_response_model.dart';
import 'user_response_model.dart';

part 'update_profile_response_model.freezed.dart';
part 'update_profile_response_model.g.dart';

@freezed
abstract class UpdateProfileResponseModel with _$UpdateProfileResponseModel {
  const UpdateProfileResponseModel._();

  const factory UpdateProfileResponseModel({
    required UserResponseModel user,
    required UserDetailResponseModel userDetail,
  }) = _UpdateProfileResponseModel;

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseModelFromJson(json);

  /// Convert to domain entity
  UserProfile toEntity() {
    return UserProfile(
      user: UserProfileUser(
        id: user.id,
        email: user.email,
        role: user.role,
        phone: user.phone,
        status: user.status,
        balance: user.balance,
        merchantId: user.merchantId,
        country: user.country,
        createdAt: user.createdAt,
      ),
      detail: UserProfileDetail(
        firstName: userDetail.firstName,
        lastName: userDetail.lastName,
        fullName: userDetail.fullName,
        address: userDetail.address,
        birthDate: userDetail.birthDate,
        profilePicture: userDetail.profilePicture,
        gatePoint: userDetail.gatePoint,
        verify: userDetail.verify,
        vaccount: userDetail.vaccount,
      ),
      settings: null, // Settings not returned by update endpoint
    );
  }
}
