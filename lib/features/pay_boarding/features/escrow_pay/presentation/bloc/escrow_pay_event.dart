// lib/features/pay_boarding/features/escrow_pay/presentation/bloc/escrow_pay_event.dart
import 'package:equatable/equatable.dart';

abstract class EscrowpayEvent extends Equatable {
  const EscrowpayEvent();

  @override
  List<Object?> get props => [];
}

class LoadEscrowpay extends EscrowpayEvent {
  const LoadEscrowpay();
}

class RefreshEscrowpay extends EscrowpayEvent {
  const RefreshEscrowpay();
}

class UpdateProductName extends EscrowpayEvent {
  final String productName;

  const UpdateProductName(this.productName);

  @override
  List<Object> get props => [productName];
}

class UpdateProductDescription extends EscrowpayEvent {
  final String description;

  const UpdateProductDescription(this.description);

  @override
  List<Object> get props => [description];
}

class UpdatePricing extends EscrowpayEvent {
  final double sellerReceive;
  final double youPay;

  const UpdatePricing({required this.sellerReceive, required this.youPay});

  @override
  List<Object> get props => [sellerReceive, youPay];
}

class UpdateSellerInfo extends EscrowpayEvent {
  final bool hasAccount;
  final String sellerIdentifier; // username or phone

  const UpdateSellerInfo({
    required this.hasAccount,
    required this.sellerIdentifier,
  });

  @override
  List<Object> get props => [hasAccount, sellerIdentifier];
}

class ValidateSellerIdentifier extends EscrowpayEvent {
  final String identifier;
  final bool isUsername;

  const ValidateSellerIdentifier({
    required this.identifier,
    required this.isUsername,
  });

  @override
  List<Object> get props => [identifier, isUsername];
}

class ToggleAgreement extends EscrowpayEvent {
  final AgreementType type;
  final bool isAgreed;

  const ToggleAgreement({required this.type, required this.isAgreed});

  @override
  List<Object> get props => [type, isAgreed];
}

class SubmitEscrowTransaction extends EscrowpayEvent {
  const SubmitEscrowTransaction();
}

enum AgreementType { privacyAndRefund, gatepayPolicy, termsAndConditions }
