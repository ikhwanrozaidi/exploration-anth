import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import 'pay_boarding_event.dart';
import 'pay_boarding_state.dart';

@injectable
class PayBoardingBloc extends Bloc<PayBoardingEvent, PayBoardingState> {
  // TODO: Add use cases when domain layer is created
  // final GetAvailablePaymentMethodsUseCase _getAvailablePaymentMethodsUseCase;

  PayBoardingBloc(
    // this._getAvailablePaymentMethodsUseCase,
  ) : super(const PayBoardingInitial()) {
    on<LoadPayBoarding>(_onLoadPayBoarding);
    on<RefreshPayBoarding>(_onRefreshPayBoarding);
    on<SelectPaymentMethod>(_onSelectPaymentMethod);
  }

  Future<void> _onLoadPayBoarding(
    LoadPayBoarding event,
    Emitter<PayBoardingState> emit,
  ) async {
    emit(const PayBoardingLoading());

    try {
      // result.fold(
      //   (failure) => emit(PayBoardingError(_mapFailureToMessage(failure))),
      //   (methods) => emit(PayBoardingLoaded(availableMethods: methods)),
      // );

      emit(PayBoardingLoaded(availableMethods: availableMethods));
    } catch (e) {
      emit(PayBoardingError('Failed to load payment methods: ${e.toString()}'));
    }
  }

  Future<void> _onRefreshPayBoarding(
    RefreshPayBoarding event,
    Emitter<PayBoardingState> emit,
  ) async {
    if (state is PayBoardingLoaded) {
      try {
        // Refresh without showing loading
        await Future.delayed(const Duration(milliseconds: 300));

        // Keep current state but refresh any dynamic data
        final currentState = state as PayBoardingLoaded;
        emit(currentState.copyWith());
      } catch (e) {
        emit(PayBoardingError('Failed to refresh: ${e.toString()}'));
      }
    }
  }

  void _onSelectPaymentMethod(
    SelectPaymentMethod event,
    Emitter<PayBoardingState> emit,
  ) {
    if (state is PayBoardingLoaded) {
      final currentState = state as PayBoardingLoaded;
      emit(currentState.copyWith(selectedMethod: event.methodType));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ConnectionFailure:
        return 'No internet connection. Please check your network.';
      case TimeoutFailure:
        return 'Request timeout. Please try again.';
      case ServerFailure:
        return failure.message.isNotEmpty
            ? failure.message
            : 'Server error occurred. Please try again.';
      case NetworkFailure:
        return 'Network error occurred. Please check your connection.';
      default:
        return failure.message.isEmpty
            ? 'An unexpected error occurred. Please try again.'
            : failure.message;
    }
  }
}

// Mock available payment methods
final availableMethods = [
  const PaymentMethod(
    type: PaymentMethodType.qrCode,
    title: 'QR Code',
    description: 'Quick and easy QR code payments',
    features: [
      'Direct bank account transaction (Note: Scam can occur)',
      'Scan seller\'s QR Code for escrow transaction',
    ],
  ),
  const PaymentMethod(
    type: PaymentMethodType.escrow,
    title: 'Escrow',
    description: 'Secure escrow transactions',
    features: [
      'Create your own escrow transaction to any sellers with GatePay account',
      'Full protection for both buyer and seller',
    ],
  ),
];
