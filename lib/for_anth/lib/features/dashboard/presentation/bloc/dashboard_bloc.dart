// lib/features/dashboard/presentation/bloc/dashboard_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

@lazySingleton
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  // You can inject your dashboard repository/use cases here
  // final DashboardRepository _dashboardRepository;

  DashboardBloc(
    // this._dashboardRepository,
  ) : super(const DashboardState.initial()) {
    on<DashboardLoadRequested>(_onDashboardLoadRequested);
    on<DashboardRefreshRequested>(_onDashboardRefreshRequested);
    on<DashboardRetryRequested>(_onDashboardRetryRequested);
  }

  Future<void> _onDashboardLoadRequested(
    DashboardLoadRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    await _loadDashboardData(emit);
  }

  Future<void> _onDashboardRefreshRequested(
    DashboardRefreshRequested event,
    Emitter<DashboardState> emit,
  ) async {
    // Don't show loading for refresh, just reload data
    await _loadDashboardData(emit);
  }

  Future<void> _onDashboardRetryRequested(
    DashboardRetryRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    await _loadDashboardData(emit);
  }

  Future<void> _loadDashboardData(Emitter<DashboardState> emit) async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // TODO: Replace with actual API call
      // final result = await _dashboardRepository.getDashboardData();

      // Mock data - replace with actual data from your API
      const mockData = DashboardLoaded(
        userName: 'Enquiry',
        balance: 250.00,
        currency: 'MYR',
        accountNumber: '8004 8000 01225',
        wallets: [
          CurrencyWallet(
            currencyCode: 'MYR',
            countryCode: 'MY',
            balance: 0.00,
            displayName: 'Malaysia (MYR)',
          ),
          // Add more wallets as needed
        ],
      );

      emit(mockData);
    } catch (error) {
      emit(DashboardState.error(error.toString()));
    }
  }
}