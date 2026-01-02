import 'package:json_annotation/json_annotation.dart';

part 'search_username_request_model.g.dart';

@JsonSerializable()
class SearchUsernameRequestModel {
  final String sellerUsername;

  const SearchUsernameRequestModel({required this.sellerUsername});

  factory SearchUsernameRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SearchUsernameRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchUsernameRequestModelToJson(this);
}
