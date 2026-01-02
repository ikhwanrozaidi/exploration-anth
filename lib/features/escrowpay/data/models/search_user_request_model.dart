import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_user_request_model.freezed.dart';
part 'search_user_request_model.g.dart';

@freezed
abstract class SearchUserRequestModel with _$SearchUserRequestModel {
  const factory SearchUserRequestModel({String? username, String? phone}) =
      _SearchUserRequestModel;

  factory SearchUserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SearchUserRequestModelFromJson(json);
}
