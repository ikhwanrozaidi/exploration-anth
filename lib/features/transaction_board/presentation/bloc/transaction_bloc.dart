import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/clear_transaction_cache_usecase.dart';
import '../../domain/usecases/get_user_transaction.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';

@lazySingleton
class TransactionboardBloc
    extends Bloc<TransactionboardEvent, TransactionboardState> {
  final GetUserTransactionsUseCase _getUserTransactionsUseCase;
  final ClearTransactionCacheUseCase _clearTransactionCacheUseCase;

  TransactionboardBloc(
    this._getUserTransactionsUseCase,
    this._clearTransactionCacheUseCase,
  ) : super(const TransactionboardInitial()) {
    on<LoadTransactionboard>(_onLoadTransactionboard);
    on<RefreshTransactionboard>(_onRefreshTransactionboard);
    on<ClearTransactionCache>(_onClearCache);
  }

  Future<void> _onLoadTransactionboard(
    LoadTransactionboard event,
    Emitter<TransactionboardState> emit,
  ) async {
    print('🔵 [TransactionboardBloc] LoadTransactionboard event received');
    emit(const TransactionboardState.loading());

    final result = await _getUserTransactionsUseCase();

    result.fold(
      (failure) {
        print(
          '🔴 [TransactionboardBloc] Failed: ${_mapFailureToMessage(failure)}',
        );
        emit(TransactionboardState.error(_mapFailureToMessage(failure)));
      },
      (data) {
        print(
          '🟢 [TransactionboardBloc] Loaded ${data.transactions.length} transactions',
        );
        emit(TransactionboardState.loaded(data: data));
      },
    );
  }

  Future<void> _onRefreshTransactionboard(
    RefreshTransactionboard event,
    Emitter<TransactionboardState> emit,
  ) async {
    print('🔵 [TransactionboardBloc] RefreshTransactionboard event received');

    // Don't show loading state for refresh, just fetch new data
    final result = await _getUserTransactionsUseCase();

    result.fold(
      (failure) {
        print(
          '🔴 [TransactionboardBloc] Refresh failed: ${_mapFailureToMessage(failure)}',
        );
        emit(TransactionboardState.error(_mapFailureToMessage(failure)));
      },
      (data) {
        print(
          '🟢 [TransactionboardBloc] Refreshed ${data.transactions.length} transactions',
        );
        emit(TransactionboardState.loaded(data: data));
      },
    );
  }

  Future<void> _onClearCache(
    ClearTransactionCache event,
    Emitter<TransactionboardState> emit,
  ) async {
    print('🔵 [TransactionboardBloc] ClearCache event received');

    final result = await _clearTransactionCacheUseCase();

    result.fold(
      (failure) {
        print(
          '🔴 [TransactionboardBloc] Clear cache failed: ${_mapFailureToMessage(failure)}',
        );
      },
      (_) {
        print('🟢 [TransactionboardBloc] Cache cleared successfully');
        // Reload data after clearing cache
        add(const TransactionboardEvent.loadTransactionboard());
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return (failure as ServerFailure).message;
      case const (CacheFailure):
        return (failure as CacheFailure).message;
      case const (ConnectionFailure):
        return 'No internet connection. Showing cached data.';
      case const (ValidationFailure):
        return (failure as ValidationFailure).message;
      default:
        return 'Unexpected error occurred';
    }
  }
}
