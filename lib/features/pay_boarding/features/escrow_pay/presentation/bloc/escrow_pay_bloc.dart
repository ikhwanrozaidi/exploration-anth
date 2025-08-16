// lib/features/pay_boarding/features/escrow_pay/presentation/bloc/escrow_pay_bloc.dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/errors/failures.dart';
import '../../domain/entities/escrow_payment.dart';
import '../../domain/entities/seller_info_entity.dart';
import '../../domain/usecases/create_payment_usecase.dart';
import '../../domain/usecases/search_seller_usecase.dart';
import 'escrow_pay_event.dart';
import 'escrow_pay_state.dart';

@injectable
class EscrowpayBloc extends Bloc<EscrowpayEvent, EscrowpayState> {
  final CreatePaymentUseCase _createPaymentUseCase;
  final SearchUsernameUseCase _searchUsernameUseCase;
  final SearchPhoneUseCase _searchPhoneUseCase;

  Timer? _debounceTimer;

  EscrowpayBloc(
    this._createPaymentUseCase,
    this._searchUsernameUseCase,
    this._searchPhoneUseCase,
  ) : super(const EscrowpayInitial()) {
    print(
      'EscrowpayBloc - Constructor called, initial state: ${state.runtimeType}',
    );
    on<LoadEscrowpay>(_onLoadEscrowpay);
    on<RefreshEscrowpay>(_onRefreshEscrowpay);
    on<UpdateProductName>(_onUpdateProductName);
    on<UpdateProductDescription>(_onUpdateProductDescription);
    on<UpdatePricing>(_onUpdatePricing);
    on<UpdateSellerInfo>(_onUpdateSellerInfo);
    on<ValidateSellerIdentifier>(_onValidateSellerIdentifier);
    on<ToggleAgreement>(_onToggleAgreement);
    on<SubmitEscrowTransaction>(_onSubmitEscrowTransaction);
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
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

  void _onUpdatePricing(UpdatePricing event, Emitter<EscrowpayState> emit) {
    if (state is EscrowpayLoaded) {
      final currentState = state as EscrowpayLoaded;
      emit(
        currentState.copyWith(
          sellerReceive: event.sellerReceive,
          youPay: event.youPay,
        ),
      );
    }
  }

  void _onUpdateSellerInfo(
    UpdateSellerInfo event,
    Emitter<EscrowpayState> emit,
  ) {
    if (state is EscrowpayLoaded) {
      final currentState = state as EscrowpayLoaded;
      emit(
        currentState.copyWith(
          hasAccount: event.hasAccount,
          sellerIdentifier: event.sellerIdentifier,
          // Reset validation when type changes
          sellerValidationState: event.sellerIdentifier.isEmpty
              ? SellerValidationState.initial
              : currentState.sellerValidationState,
        ),
      );
    }
  }

  void _onValidateSellerIdentifier(
    ValidateSellerIdentifier event,
    Emitter<EscrowpayState> emit,
  ) {
    print('🔍 BLoC: Received ValidateSellerIdentifier event');
    print(
      '🔍 BLoC: identifier="${event.identifier}", isUsername=${event.isUsername}',
    );

    if (state is! EscrowpayLoaded) {
      print('🔍 BLoC: State is not EscrowpayLoaded, returning');
      return;
    }

    final currentState = state as EscrowpayLoaded;

    // Cancel previous timer
    _debounceTimer?.cancel();

    if (event.identifier.isEmpty) {
      print('🔍 BLoC: Identifier is empty, setting initial state');
      emit(
        currentState.copyWith(
          sellerValidationState: SellerValidationState.initial,
          sellerInfo: null,
        ),
      );
      return;
    }

    // Set validating state immediately
    print('🔍 BLoC: Setting validating state');
    emit(
      currentState.copyWith(
        sellerValidationState: SellerValidationState.validating,
      ),
    );

    // Debounce the API call
    print('🔍 BLoC: Setting up API call timer');
    _debounceTimer = Timer(const Duration(milliseconds: 800), () {
      print('🔍 BLoC: API call timer fired, calling _performValidation');
      _performValidation(event.identifier, event.isUsername);
    });
  }

  Future<void> _performValidation(String identifier, bool isUsername) async {
    print(
      '🔍 BLoC: _performValidation called with identifier="$identifier", isUsername=$isUsername',
    );

    if (state is! EscrowpayLoaded) {
      print('🔍 BLoC: State is not EscrowpayLoaded in _performValidation');
      return;
    }

    final currentState = state as EscrowpayLoaded;

    try {
      if (isUsername) {
        print('🔍 BLoC: Searching username: $identifier');
        final result = await _searchUsernameUseCase(
          SearchUsernameParams(identifier),
        );
        print('🔍 BLoC: Username search result: ${result.runtimeType}');
        result.fold(
          (failure) {
            print('🔍 BLoC: Username search failed: ${failure.message}');
            emit(
              currentState.copyWith(
                sellerValidationState: SellerValidationState.invalid,
                validationMessage: _mapFailureToMessage(failure),
              ),
            );
          },
          (validation) {
            print('🔍 BLoC: Username search success: ${validation.result}');
            _handleValidationResult(validation);
          },
        );
      } else {
        print('🔍 BLoC: Searching phone: $identifier');
        final result = await _searchPhoneUseCase(SearchPhoneParams(identifier));
        print('🔍 BLoC: Phone search result: ${result.runtimeType}');
        result.fold(
          (failure) {
            print('🔍 BLoC: Phone search failed: ${failure.message}');
            emit(
              currentState.copyWith(
                sellerValidationState: SellerValidationState.invalid,
                validationMessage: _mapFailureToMessage(failure),
              ),
            );
          },
          (validation) {
            print('🔍 BLoC: Phone search success: ${validation.result}');
            _handleValidationResult(validation);
          },
        );
      }
    } catch (e) {
      print('🔍 BLoC: Exception in _performValidation: $e');
      if (state is EscrowpayLoaded) {
        final currentState = state as EscrowpayLoaded;
        emit(
          currentState.copyWith(
            sellerValidationState: SellerValidationState.invalid,
            validationMessage: 'Validation failed: ${e.toString()}',
          ),
        );
      }
    }
  }

  void _handleValidationResult(SellerValidation validation) {
    if (state is! EscrowpayLoaded) return;

    final currentState = state as EscrowpayLoaded;

    switch (validation.result) {
      case SellerValidationResult.valid:
        emit(
          currentState.copyWith(
            sellerValidationState: SellerValidationState.valid,
            validationMessage: validation.message,
            sellerInfo: validation.sellerInfo,
          ),
        );
        break;
      case SellerValidationResult.shouldUseUsername:
        emit(
          currentState.copyWith(
            sellerValidationState: SellerValidationState.shouldUseUsername,
            validationMessage: validation.message,
          ),
        );
        break;
      case SellerValidationResult.shouldUsePhone:
        emit(
          currentState.copyWith(
            sellerValidationState: SellerValidationState.shouldUsePhone,
            validationMessage: validation.message,
          ),
        );
        break;
      case SellerValidationResult.notFound:
        emit(
          currentState.copyWith(
            sellerValidationState: SellerValidationState.invalid,
            validationMessage: validation.message,
          ),
        );
        break;
    }
  }

  void _onToggleAgreement(ToggleAgreement event, Emitter<EscrowpayState> emit) {
    if (state is EscrowpayLoaded) {
      final currentState = state as EscrowpayLoaded;
      final updatedAgreements = Map<AgreementType, bool>.from(
        currentState.agreements,
      );
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
        emit(
          const EscrowpayError(
            'Please fill all required fields and agree to all terms',
          ),
        );
        return;
      }

      // Validate seller
      if (currentState.sellerValidationState != SellerValidationState.valid) {
        emit(const EscrowpayError('Please provide a valid seller identifier'));
        return;
      }

      emit(const EscrowpayLoading());

      try {
        // Prepare product descriptions
        final productDescriptions = currentState.productDescription
            .split('\n')
            .where((desc) => desc.trim().isNotEmpty)
            .map((desc) => ProductDescription(description: desc.trim()))
            .toList();

        // Use seller ID from validation result
        final sellerId =
            currentState.sellerInfo?.userId ?? currentState.sellerIdentifier;

        final result = await _createPaymentUseCase(
          CreatePaymentParams(
            productName: currentState.productName,
            productDesc: productDescriptions,
            productCat: 'General', // Default category, can be made configurable
            price: currentState.youPay,
            sellerId: sellerId,
            isRequested: false, // Default to false, can be made configurable
          ),
        );

        result.fold(
          (failure) => emit(EscrowpayError(_mapFailureToMessage(failure))),
          (message) => emit(EscrowpayTransactionSubmitted(message)),
        );
      } catch (e) {
        emit(
          EscrowpayError(
            'Failed to create escrow transaction: ${e.toString()}',
          ),
        );
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
