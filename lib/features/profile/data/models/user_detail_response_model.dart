import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail_response_model.freezed.dart';
part 'user_detail_response_model.g.dart';

@freezed
abstract class UserDetailResponseModel with _$UserDetailResponseModel {
  const factory UserDetailResponseModel({
    required int userId,
    required String firstName,
    required String lastName,
    required String fullName,
    String? address,
    String? birthDate,
    String? profilePicture,
    required int gatePoint,
    required String verify,
    String? vaccount,
  }) = _UserDetailResponseModel;

  factory UserDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailResponseModelFromJson(json);
}
