import 'package:equatable/equatable.dart';
import 'payment_details.dart';
import 'transaction_user.dart';

class Transaction extends Equatable {
  final String paymentId;
  final String paymentType; // 'p2p' or 'gateway'
  final int sellerId;
  final int buyerId;
  final int? merchantId;
  final int amount;
  final String providerId;
  final bool isCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String userRole; // 'buyer' or 'seller'
  final PaymentDetails paymentDetails;
  final TransactionUser? seller;
  final TransactionUser buyer;

  const Transaction({
    required this.paymentId,
    required this.paymentType,
    required this.sellerId,
    required this.buyerId,
    this.merchantId,
    required this.amount,
    required this.providerId,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
    required this.userRole,
    required this.paymentDetails,
    this.seller,
    required this.buyer,
  });

  @override
  List<Object?> get props => [
    paymentId,
    paymentType,
    sellerId,
    buyerId,
    merchantId,
    amount,
    providerId,
    isCompleted,
    createdAt,
    updatedAt,
    userRole,
    paymentDetails,
    seller,
    buyer,
  ];
}
