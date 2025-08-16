import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/seller_info_entity.dart';
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
  final SellerValidationState sellerValidationState;
  final String validationMessage;
  final SellerInfo? sellerInfo;

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
    this.sellerValidationState = SellerValidationState.initial,
    this.validationMessage = '',
    this.sellerInfo,
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
    sellerValidationState,
    validationMessage,
    sellerInfo,
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
    SellerValidationState? sellerValidationState,
    String? validationMessage,
    SellerInfo? sellerInfo,
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
      sellerValidationState:
          sellerValidationState ?? this.sellerValidationState,
      validationMessage: validationMessage ?? this.validationMessage,
      sellerInfo: sellerInfo ?? this.sellerInfo,
    );
  }

  bool get isFormValid {
    return productName.isNotEmpty &&
        productDescription.isNotEmpty &&
        sellerReceive > 0 &&
        youPay > 0 &&
        sellerIdentifier.isNotEmpty &&
        sellerValidationState == SellerValidationState.valid &&
        agreements.values.every((agreed) => agreed);
  }

  bool get areAllAgreementsChecked {
    return agreements.values.every((agreed) => agreed);
  }

  // Get border color for validation feedback
  Color get validationBorderColor {
    switch (sellerValidationState) {
      case SellerValidationState.initial:
        return Colors.grey.shade300;
      case SellerValidationState.validating:
        return Colors.blue;
      case SellerValidationState.valid:
        return Colors.green;
      case SellerValidationState.invalid:
      case SellerValidationState.shouldUseUsername:
      case SellerValidationState.shouldUsePhone:
        return Colors.red;
    }
  }

  // Get validation icon
  IconData? get validationIcon {
    switch (sellerValidationState) {
      case SellerValidationState.validating:
        return null; // Will show loading indicator
      case SellerValidationState.valid:
        return Icons.check_circle;
      case SellerValidationState.invalid:
      case SellerValidationState.shouldUseUsername:
      case SellerValidationState.shouldUsePhone:
        return Icons.error;
      case SellerValidationState.initial:
        return null;
    }
  }
}

class EscrowpayError extends EscrowpayState {
  final String message;

  const EscrowpayError(this.message);

  @override
  List<Object> get props => [message];
}

class EscrowpayTransactionSubmitted extends EscrowpayState {
  final String message;

  const EscrowpayTransactionSubmitted(this.message);

  @override
  List<Object> get props => [message];
}

enum SellerValidationState {
  initial,
  validating,
  valid,
  invalid,
  shouldUseUsername,
  shouldUsePhone,
}
