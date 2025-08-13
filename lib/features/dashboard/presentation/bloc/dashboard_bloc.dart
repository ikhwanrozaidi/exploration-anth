import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/onhold_balance.dart';
import '../../domain/entities/onhold_transaction.dart';
import '../../domain/entities/user_detail.dart';
import '../../domain/usecases/get_user_detail_usecase.dart';
import '../../domain/usecases/get_onhold_transactions_usecase.dart';
import '../../domain/usecases/get_onhold_balance_usecase.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetUserDetailUseCase _getUserDetailUseCase;
  final GetOnholdTransactionsUseCase _getOnholdTransactionsUseCase;
  final GetOnholdBalanceUseCase _getOnholdBalanceUseCase;

  DashboardBloc(
    this._getUserDetailUseCase,
    this._getOnholdTransactionsUseCase,
    this._getOnholdBalanceUseCase,
  ) : super(const DashboardInitial()) {
    on<LoadDashboardData>(_onLoadDashboardData);
    on<RefreshDashboardData>(_onRefreshDashboardData);
  }

  Future<void> _onLoadDashboardData(
    LoadDashboardData event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardLoading());
    await _loadDashboardData(emit);
  }

  Future<void> _onRefreshDashboardData(
    RefreshDashboardData event,
    Emitter<DashboardState> emit,
  ) async {
    // Don't show loading for refresh, keep current state
    await _loadDashboardData(emit);
  }

  Future<void> _loadDashboardData(Emitter<DashboardState> emit) async {
    try {
      // Load all data concurrently
      final results = await Future.wait([
        _getUserDetailUseCase(),
        _getOnholdTransactionsUseCase(),
        _getOnholdBalanceUseCase(),
      ]);

      final userDetailResult = results[0];
      final transactionsResult = results[1];
      final balanceResult = results[2];

      // Check if all requests succeeded
      final userDetailSuccess = userDetailResult.fold((l) => null, (r) => r as UserDetail?);
      final transactionsSuccess = transactionsResult.fold((l) => null, (r) => r as List<OnholdTransaction>?);
      final balanceSuccess = balanceResult.fold((l) => null, (r) => r as OnholdBalance?);

      if (userDetailSuccess != null && 
          transactionsSuccess != null && 
          balanceSuccess != null) {
        // All data loaded successfully
        emit(DashboardLoaded(
          userDetail: userDetailSuccess,
          onholdTransactions: transactionsSuccess,
          onholdBalance: balanceSuccess,
        ));
      } else {
        // Some data failed to load
        final errors = <String>[];
        
        userDetailResult.fold((failure) => errors.add('User detail: ${failure.message}'), (r) => null);
        transactionsResult.fold((failure) => errors.add('Transactions: ${failure.message}'), (r) => null);
        balanceResult.fold((failure) => errors.add('Balance: ${failure.message}'), (r) => null);

        if (userDetailSuccess != null || transactionsSuccess != null || balanceSuccess != null) {
          // Partial success
          emit(DashboardPartialLoaded(
            userDetail: userDetailSuccess,
            onholdTransactions: transactionsSuccess,
            onholdBalance: balanceSuccess,
            error: errors.join(', '),
          ));
        } else {
          // Complete failure
          emit(DashboardError(errors.join(', ')));
        }
      }
    } catch (e) {
      emit(DashboardError('Unexpected error: $e'));
    }
  }
}