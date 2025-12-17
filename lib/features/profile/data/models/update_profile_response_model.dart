import 'package:json_annotation/json_annotation.dart';
import '../../../login/domain/entities/user.dart';

part 'update_profile_response_model.g.dart';

@JsonSerializable()
class UpdateProfileResponseModel {
  final User user;
  final Map<String, dynamic> userDetail;

  const UpdateProfileResponseModel({
    required this.user,
    required this.userDetail,
  });

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileResponseModelToJson(this);
}
