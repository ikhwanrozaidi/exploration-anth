import 'package:json_annotation/json_annotation.dart';

part 'create_payment_request_model.g.dart';

@JsonSerializable()
class CreatePaymentRequestModel {
  final String productName;
  final String productDesc;
  final String productCat;
  final String price;
  final String sellerId;
  final String isRequested;

  const CreatePaymentRequestModel({
    required this.productName,
    required this.productDesc,
    required this.productCat,
    required this.price,
    required this.sellerId,
    required this.isRequested,
  });

  factory CreatePaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePaymentRequestModelToJson(this);
}
