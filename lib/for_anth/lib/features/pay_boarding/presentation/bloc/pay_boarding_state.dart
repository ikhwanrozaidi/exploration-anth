import 'package:equatable/equatable.dart';
import 'pay_boarding_event.dart';

abstract class PayBoardingState extends Equatable {
  const PayBoardingState();

  @override
  List<Object?> get props => [];
}

class PayBoardingInitial extends PayBoardingState {
  const PayBoardingInitial();
}

class PayBoardingLoading extends PayBoardingState {
  const PayBoardingLoading();
}

class PayBoardingLoaded extends PayBoardingState {
  final List<PaymentMethod> availableMethods;
  final PaymentMethodType? selectedMethod;

  const PayBoardingLoaded({
    required this.availableMethods,
    this.selectedMethod,
  });

  @override
  List<Object?> get props => [availableMethods, selectedMethod];

  PayBoardingLoaded copyWith({
    List<PaymentMethod>? availableMethods,
    PaymentMethodType? selectedMethod,
  }) {
    return PayBoardingLoaded(
      availableMethods: availableMethods ?? this.availableMethods,
      selectedMethod: selectedMethod ?? this.selectedMethod,
    );
  }
}

class PayBoardingError extends PayBoardingState {
  final String message;

  const PayBoardingError(this.message);

  @override
  List<Object> get props => [message];
}

class PaymentMethod {
  final PaymentMethodType type;
  final String title;
  final String description;
  final String? imagePath;
  final bool isEnabled;
  final List<String> features;

  const PaymentMethod({
    required this.type,
    required this.title,
    required this.description,
    this.imagePath,
    this.isEnabled = true,
    this.features = const [],
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentMethod &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}