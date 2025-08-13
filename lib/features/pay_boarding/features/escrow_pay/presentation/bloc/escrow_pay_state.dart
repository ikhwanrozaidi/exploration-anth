import 'package:equatable/equatable.dart';

import 'escrow_pay_event.dart';

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

class EscrowpayLoaded extends EscrowpayState {
  final String productName;
  final String productDescription;
  final double sellerReceive;
  final double youPay;
  final bool hasAccount;
  final String sellerIdentifier;
  final Map<AgreementType, bool> agreements;
  final double incrementFactor;

  const EscrowpayLoaded({
    this.productName = '',
    this.productDescription = '',
    this.sellerReceive = 0.0,
    this.youPay = 0.0,
    this.hasAccount = true,
    this.sellerIdentifier = '',
    this.agreements = const {
      AgreementType.privacyAndRefund: false,
      AgreementType.gatepayPolicy: false,
      AgreementType.termsAndConditions: false,
    },
    this.incrementFactor = 0.03,
  });

  @override
  List<Object?> get props => [
        productName,
        productDescription,
        sellerReceive,
        youPay,
        hasAccount,
        sellerIdentifier,
        agreements,
        incrementFactor,
      ];

  EscrowpayLoaded copyWith({
    String? productName,
    String? productDescription,
    double? sellerReceive,
    double? youPay,
    bool? hasAccount,
    String? sellerIdentifier,
    Map<AgreementType, bool>? agreements,
    double? incrementFactor,
  }) {
    return EscrowpayLoaded(
      productName: productName ?? this.productName,
      productDescription: productDescription ?? this.productDescription,
      sellerReceive: sellerReceive ?? this.sellerReceive,
      youPay: youPay ?? this.youPay,
      hasAccount: hasAccount ?? this.hasAccount,
      sellerIdentifier: sellerIdentifier ?? this.sellerIdentifier,
      agreements: agreements ?? this.agreements,
      incrementFactor: incrementFactor ?? this.incrementFactor,
    );
  }

  bool get isFormValid {
    return productName.isNotEmpty &&
           productDescription.isNotEmpty &&
           sellerReceive > 0 &&
           youPay > 0 &&
           sellerIdentifier.isNotEmpty &&
           agreements.values.every((agreed) => agreed);
  }

  bool get areAllAgreementsChecked {
    return agreements.values.every((agreed) => agreed);
  }
}

class EscrowpayError extends EscrowpayState {
  final String message;

  const EscrowpayError(this.message);

  @override
  List<Object> get props => [message];
}

class EscrowpayTransactionSubmitted extends EscrowpayState {
  final String transactionId;

  const EscrowpayTransactionSubmitted(this.transactionId);

  @override
  List<Object> get props => [transactionId];
}