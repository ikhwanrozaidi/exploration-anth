import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/transaction.dart';
import 'payment_details_model.dart';
import 'transaction_user_model.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {
  const TransactionModel._();

  const factory TransactionModel({
    required String paymentId,
    required String paymentType,
    required int sellerId,
    required int buyerId,
    int? merchantId,
    required int amount,
    required String providerId,
    required bool isCompleted,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String userRole,
    required PaymentDetailsModel paymentDetails,
    TransactionUserModel? seller,
    required TransactionUserModel buyer,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  /// Convert model to entity
  Transaction toEntity() {
    return Transaction(
      paymentId: paymentId,
      paymentType: paymentType,
      sellerId: sellerId,
      buyerId: buyerId,
      merchantId: merchantId,
      amount: amount,
      providerId: providerId,
      isCompleted: isCompleted,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userRole: userRole,
      paymentDetails: paymentDetails.toEntity(),
      seller: seller?.toEntity(),
      buyer: buyer.toEntity(),
    );
  }
}
