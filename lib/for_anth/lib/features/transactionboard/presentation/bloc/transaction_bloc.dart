// lib/features/transactionboard/presentation/bloc/transactionboard_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';

@lazySingleton
class TransactionboardBloc extends Bloc<TransactionboardEvent, TransactionboardState> {
  // TODO: Add use cases when domain layer is created
  // final GetTransactionboardUseCase _getTransactionboardUseCase;

  TransactionboardBloc(
    // this._getTransactionboardUseCase,
  ) : super(const TransactionboardInitial()) {
    on<LoadTransactionboard>(_onLoadTransactionboard);
    on<RefreshTransactionboard>(_onRefreshTransactionboard);
  }

  Future<void> _onLoadTransactionboard(
    LoadTransactionboard event,
    Emitter<TransactionboardState> emit,
  ) async {
    emit(const TransactionboardLoading());

    try {
      // TODO: Implement when use case is ready
      // final result = await _getTransactionboardUseCase();
      
      // Simulate loading for now
      await Future.delayed(const Duration(milliseconds: 500));
      
      // result.fold(
      //   (failure) => emit(TransactionboardError(_mapFailureToMessage(failure))),
      //   (data) => emit(const TransactionboardLoaded()),
      // );
      
      // For now, just emit loaded state
      emit(const TransactionboardLoaded());
    } catch (e) {
      emit(TransactionboardError('An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> _onRefreshTransactionboard(
    RefreshTransactionboard event,
    Emitter<TransactionboardState> emit,
  ) async {
    // Don't show loading state for refresh, just update data
    try {
      // TODO: Implement when use case is ready
      // final result = await _getTransactionboardUseCase();
      
      // Simulate refresh for now
      await Future.delayed(const Duration(milliseconds: 500));
      
      // result.fold(
      //   (failure) => emit(TransactionboardError(_mapFailureToMessage(failure))),
      //   (data) => emit(const TransactionboardLoaded()),
      // );
      
      // For now, just emit loaded state
      emit(const TransactionboardLoaded());
    } catch (e) {
      emit(TransactionboardError('Failed to refresh: ${e.toString()}'));
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