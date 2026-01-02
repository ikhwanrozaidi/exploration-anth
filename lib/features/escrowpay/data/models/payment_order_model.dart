import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../transaction_board/data/models/payment_details_model.dart';
import '../../domain/entities/payment_order_entity.dart';
import 'user_info_model.dart';

part 'payment_order_model.freezed.dart';
part 'payment_order_model.g.dart';

@freezed
abstract class PaymentOrderModel with _$PaymentOrderModel {
  const PaymentOrderModel._();

  const factory PaymentOrderModel({
    required String paymentId,
    required String paymentType,
    required int sellerId,
    required int buyerId,
    required double amount,
    required bool isRequest,
    required String status,
    required bool isCompleted,
    required PaymentDetailsModel paymentDetails,
    required UserInfoModel buyer,
    required UserInfoModel seller,
  }) = _PaymentOrderModel;

  factory PaymentOrderModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentOrderModelFromJson(json);

  /// Convert model to entity
  PaymentOrderEntity toEntity() {
    return PaymentOrderEntity(
      paymentId: paymentId,
      paymentType: paymentType,
      sellerId: sellerId,
      buyerId: buyerId,
      amount: amount,
      isRequest: isRequest,
      status: status,
      isCompleted: isCompleted,
      paymentDetails: paymentDetails.toEntity(),
      buyer: buyer.toEntity(),
      seller: seller.toEntity(),
    );
  }

  /// Convert entity to model
  factory PaymentOrderModel.fromEntity(PaymentOrderEntity entity) {
    return PaymentOrderModel(
      paymentId: entity.paymentId,
      paymentType: entity.paymentType,
      sellerId: entity.sellerId,
      buyerId: entity.buyerId,
      amount: entity.amount,
      isRequest: entity.isRequest,
      status: entity.status,
      isCompleted: entity.isCompleted,
      paymentDetails: PaymentDetailsModel.fromEntity(entity.paymentDetails),
      buyer: UserInfoModel.fromEntity(entity.buyer),
      seller: UserInfoModel.fromEntity(entity.seller),
    );
  }
}
