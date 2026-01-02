import 'package:json_annotation/json_annotation.dart';

part 'search_phone_request_model.g.dart';

@JsonSerializable()
class SearchPhoneRequestModel {
  final String sellerPhone;

  const SearchPhoneRequestModel({required this.sellerPhone});

  factory SearchPhoneRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SearchPhoneRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPhoneRequestModelToJson(this);
}
