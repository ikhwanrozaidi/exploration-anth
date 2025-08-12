// lib/features/transactionboard/presentation/bloc/ongoing_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/errors/failures.dart';
import 'ongoing_event.dart';
import 'ongoing_state.dart';

@lazySingleton
class OngoingBloc extends Bloc<OngoingEvent, OngoingState> {
  // TODO: Add use cases when domain layer is created
  // final GetOngoingTransactionsUseCase _getOngoingTransactionsUseCase;

  OngoingBloc(
    // this._getOngoingTransactionsUseCase,
  ) : super(const OngoingInitial()) {
    on<LoadOngoingTransactions>(_onLoadOngoingTransactions);
    on<RefreshOngoingTransactions>(_onRefreshOngoingTransactions);
  }

  Future<void> _onLoadOngoingTransactions(
    LoadOngoingTransactions event,
    Emitter<OngoingState> emit,
  ) async {
    emit(const OngoingLoading());

    try {
      // TODO: Implement when use case is ready
      // final result = await _getOngoingTransactionsUseCase();
      
      // Simulate loading for now
      await Future.delayed(const Duration(milliseconds: 500));
      
      // result.fold(
      //   (failure) => emit(OngoingError(_mapFailureToMessage(failure))),
      //   (data) => emit(const OngoingLoaded()),
      // );
      
      // For now, just emit loaded state
      emit(const OngoingLoaded());
    } catch (e) {
      emit(OngoingError('An unexpected error occurred: ${e.toString()}'));
    }
  }

  Future<void> _onRefreshOngoingTransactions(
    RefreshOngoingTransactions event,
    Emitter<OngoingState> emit,
  ) async {
    // Don't show loading state for refresh, just update data
    try {
      // TODO: Implement when use case is ready
      // final result = await _getOngoingTransactionsUseCase();
      
      // Simulate refresh for now
      await Future.delayed(const Duration(milliseconds: 500));
      
      // result.fold(
      //   (failure) => emit(OngoingError(_mapFailureToMessage(failure))),
      //   (data) => emit(const OngoingLoaded()),
      // );
      
      // For now, just emit loaded state
      emit(const OngoingLoaded());
    } catch (e) {
      emit(OngoingError('Failed to refresh: ${e.toString()}'));
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