import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/payment_details.dart';

part 'payment_details_model.freezed.dart';
part 'payment_details_model.g.dart';

@freezed
abstract class PaymentDetailsModel with _$PaymentDetailsModel {
  const PaymentDetailsModel._();

  const factory PaymentDetailsModel({
    required String productName,
    required List<String> productDesc,
    required String productCat,
    required int amount,
    required bool refundable,
    required String deliveryStatus,
  }) = _PaymentDetailsModel;

  factory PaymentDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsModelFromJson(json);

  /// Convert model to entity
  PaymentDetails toEntity() {
    return PaymentDetails(
      productName: productName,
      productDesc: productDesc,
      productCat: productCat,
      amount: amount,
      refundable: refundable,
      deliveryStatus: deliveryStatus,
    );
  }
}
