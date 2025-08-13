// lib/features/escrow_pay/presentation/bloc/escrowpay_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/errors/failures.dart';
import 'escrow_pay_event.dart';
import 'escrow_pay_state.dart';

@injectable
class EscrowpayBloc extends Bloc<EscrowpayEvent, EscrowpayState> {
  // TODO: Add use cases when domain layer is created
  // final CreateEscrowTransactionUseCase _createEscrowTransactionUseCase;
  // final ValidateSellerUseCase _validateSellerUseCase;

  EscrowpayBloc(
    // this._createEscrowTransactionUseCase,
    // this._validateSellerUseCase,
  ) : super(const EscrowpayInitial()) {
    on<LoadEscrowpay>(_onLoadEscrowpay);
    on<RefreshEscrowpay>(_onRefreshEscrowpay);
    on<UpdateProductName>(_onUpdateProductName);
    on<UpdateProductDescription>(_onUpdateProductDescription);
    on<UpdatePricing>(_onUpdatePricing);
    on<UpdateSellerInfo>(_onUpdateSellerInfo);
    on<ToggleAgreement>(_onToggleAgreement);
    on<SubmitEscrowTransaction>(_onSubmitEscrowTransaction);
  }

  Future<void> _onLoadEscrowpay(
    LoadEscrowpay event,
    Emitter<EscrowpayState> emit,
  ) async {
    emit(const EscrowpayLoading());

    try {
      // Simulate loading for now
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Initialize with default state
      emit(const EscrowpayLoaded());
    } catch (e) {
      emit(EscrowpayError('Failed to load escrow payment: ${e.toString()}'));
    }
  }

  Future<void> _onRefreshEscrowpay(
    RefreshEscrowpay event,
    Emitter<EscrowpayState> emit,
  ) async {
    if (state is EscrowpayLoaded) {
      try {
        // Refresh without showing loading
        await Future.delayed(const Duration(milliseconds: 300));
        
        // Keep current state but refresh any dynamic data
        final currentState = state as EscrowpayLoaded;
        emit(currentState.copyWith());
      } catch (e) {
        emit(EscrowpayError('Failed to refresh: ${e.toString()}'));
      }
    }
  }

  void _onUpdateProductName(
    UpdateProductName event,
    Emitter<EscrowpayState> emit,
  ) {
    if (state is EscrowpayLoaded) {
      final currentState = state as EscrowpayLoaded;
      emit(currentState.copyWith(productName: event.productName));
    }
  }

  void _onUpdateProductDescription(
    UpdateProductDescription event,
    Emitter<EscrowpayState> emit,
  ) {
    if (state is EscrowpayLoaded) {
      final currentState = state as EscrowpayLoaded;
      emit(currentState.copyWith(productDescription: event.description));
    }
  }

  void _onUpdatePricing(
    UpdatePricing event,
    Emitter<EscrowpayState> emit,
  ) {
    if (state is EscrowpayLoaded) {
      final currentState = state as EscrowpayLoaded;
      emit(currentState.copyWith(
        sellerReceive: event.sellerReceive,
        youPay: event.youPay,
      ));
    }
  }

  void _onUpdateSellerInfo(
    UpdateSellerInfo event,
    Emitter<EscrowpayState> emit,
  ) {
    if (state is EscrowpayLoaded) {
      final currentState = state as EscrowpayLoaded;
      emit(currentState.copyWith(
        hasAccount: event.hasAccount,
        sellerIdentifier: event.sellerIdentifier,
      ));
    }
  }

  void _onToggleAgreement(
    ToggleAgreement event,
    Emitter<EscrowpayState> emit,
  ) {
    if (state is EscrowpayLoaded) {
      final currentState = state as EscrowpayLoaded;
      final updatedAgreements = Map<AgreementType, bool>.from(currentState.agreements);
      updatedAgreements[event.type] = event.isAgreed;
      
      emit(currentState.copyWith(agreements: updatedAgreements));
    }
  }

  Future<void> _onSubmitEscrowTransaction(
    SubmitEscrowTransaction event,
    Emitter<EscrowpayState> emit,
  ) async {
    if (state is EscrowpayLoaded) {
      final currentState = state as EscrowpayLoaded;
      
      // Validate form
      if (!currentState.isFormValid) {
        emit(const EscrowpayError('Please fill all required fields and agree to all terms'));
        return;
      }

      emit(const EscrowpayLoading());

      try {
        // TODO: Implement when use case is ready
        // final result = await _createEscrowTransactionUseCase(
        //   CreateEscrowTransactionParams(
        //     productName: currentState.productName,
        //     productDescription: currentState.productDescription,
        //     sellerReceive: currentState.sellerReceive,
        //     youPay: currentState.youPay,
        //     hasAccount: currentState.hasAccount,
        //     sellerIdentifier: currentState.sellerIdentifier,
        //   ),
        // );

        // Simulate transaction creation
        await Future.delayed(const Duration(seconds: 2));
        
        // Generate mock transaction ID
        final transactionId = 'TXN${DateTime.now().millisecondsSinceEpoch}';
        
        emit(EscrowpayTransactionSubmitted(transactionId));
      } catch (e) {
        emit(EscrowpayError('Failed to create escrow transaction: ${e.toString()}'));
      }
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ConnectionFailure:
        return 'No internet connection. Please check your network.';
      case TimeoutFailure:
        return 'Request timeout. Please try again.';
      case ValidationFailure:
        return failure.message;
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