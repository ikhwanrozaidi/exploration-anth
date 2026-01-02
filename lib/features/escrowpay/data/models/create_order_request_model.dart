import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_order_request_model.freezed.dart';
part 'create_order_request_model.g.dart';

@freezed
abstract class CreateOrderRequestModel with _$CreateOrderRequestModel {
  const factory CreateOrderRequestModel({
    required String sellerUsername,
    required String amount, // API expects string
    required String productName,
    required List<String> productDesc,
    required String productCat,
  }) = _CreateOrderRequestModel;

  factory CreateOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestModelFromJson(json);
}
