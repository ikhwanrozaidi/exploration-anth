import 'package:equatable/equatable.dart';
import '../../domain/entities/create_payment_request.dart';

abstract class EscrowpayEvent extends Equatable {
  const EscrowpayEvent();

  @override
  List<Object?> get props => [];
}

class EscrowpayFormFieldChanged extends EscrowpayEvent {
  final String productName;
  final String productDesc;
  final String price;
  final String sellerUsername;
  final String sellerPhone;

  const EscrowpayFormFieldChanged({
    required this.productName,
    required this.productDesc,
    required this.price,
    required this.sellerUsername,
    required this.sellerPhone,
  });

  @override
  List<Object?> get props => [
    productName,
    productDesc,
    price,
    sellerUsername,
    sellerPhone,
  ];
}

class EscrowpaySearchUsername extends EscrowpayEvent {
  final String username;

  const EscrowpaySearchUsername(this.username);

  @override
  List<Object?> get props => [username];
}

class EscrowpaySearchPhone extends EscrowpayEvent {
  final String phone;

  const EscrowpaySearchPhone(this.phone);

  @override
  List<Object?> get props => [phone];
}

class EscrowpayCreatePayment extends EscrowpayEvent {
  final CreatePaymentRequest request;

  const EscrowpayCreatePayment(this.request);

  @override
  List<Object?> get props => [request];
}

class EscrowpayReset extends EscrowpayEvent {
  const EscrowpayReset();
}

class EscrowpayClearSellerValidation extends EscrowpayEvent {
  const EscrowpayClearSellerValidation();
}
