import 'package:equatable/equatable.dart';

abstract class PayBoardingEvent extends Equatable {
  const PayBoardingEvent();

  @override
  List<Object?> get props => [];
}

class LoadPayBoarding extends PayBoardingEvent {
  const LoadPayBoarding();
}

class RefreshPayBoarding extends PayBoardingEvent {
  const RefreshPayBoarding();
}

class SelectPaymentMethod extends PayBoardingEvent {
  final PaymentMethodType methodType;

  const SelectPaymentMethod(this.methodType);

  @override
  List<Object> get props => [methodType];
}

enum PaymentMethodType {
  qrCode,
  escrow,
}