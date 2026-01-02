import 'package:equatable/equatable.dart';

import '../../domain/entities/seller_info_entity.dart';

abstract class EscrowpayState extends Equatable {
  const EscrowpayState();

  @override
  List<Object?> get props => [];
}

class EscrowpayInitial extends EscrowpayState {
  const EscrowpayInitial();
}

class EscrowpayLoading extends EscrowpayState {
  const EscrowpayLoading();
}

class EscrowpayFormValid extends EscrowpayState {
  final String productName;
  final String productDesc;
  final double price;
  final String sellerUsername;
  final String sellerPhone;
  final bool isFormComplete;

  const EscrowpayFormValid({
    required this.productName,
    required this.productDesc,
    required this.price,
    required this.sellerUsername,
    required this.sellerPhone,
    required this.isFormComplete,
  });

  @override
  List<Object?> get props => [
    productName,
    productDesc,
    price,
    sellerUsername,
    sellerPhone,
    isFormComplete,
  ];
}

class EscrowpaySellerSearchLoading extends EscrowpayState {
  const EscrowpaySellerSearchLoading();
}

class EscrowpaySellerFound extends EscrowpayState {
  final SellerInfo sellerInfo;
  final String searchType; // 'username' or 'phone'

  const EscrowpaySellerFound({
    required this.sellerInfo,
    required this.searchType,
  });

  @override
  List<Object?> get props => [sellerInfo, searchType];
}

class EscrowpaySellerNotFound extends EscrowpayState {
  final String message;
  final String searchType; // 'username' or 'phone'

  const EscrowpaySellerNotFound({
    required this.message,
    required this.searchType,
  });

  @override
  List<Object?> get props => [message, searchType];
}

class EscrowpaySellerValidated extends EscrowpayState {
  final String message;

  const EscrowpaySellerValidated({required this.message});

  @override
  List<Object?> get props => [message];
}

class EscrowpayPaymentCreating extends EscrowpayState {
  const EscrowpayPaymentCreating();
}

class EscrowpayPaymentSuccess extends EscrowpayState {
  final String message;

  const EscrowpayPaymentSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class EscrowpayError extends EscrowpayState {
  final String message;

  const EscrowpayError(this.message);

  @override
  List<Object?> get props => [message];
}
