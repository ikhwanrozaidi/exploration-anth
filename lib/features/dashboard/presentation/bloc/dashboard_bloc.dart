import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final ProfileBloc _profileBloc;

  DashboardBloc(this._profileBloc) : super(const DashboardState.initial()) {
    on<LoadDashboard>(_onLoadDashboard);
    on<RefreshDashboard>(_onRefreshDashboard);
  }

  Future<void> _onLoadDashboard(
    LoadDashboard event,
    Emitter<DashboardState> emit,
  ) async {
    print('🔵 [DashboardBloc] LoadDashboard event received');
    emit(const DashboardState.loading());

    // Simulate loading delay
    // await Future.delayed(const Duration(milliseconds: 500));

    print('🟢 [DashboardBloc] Dashboard ready');
    emit(const DashboardState.ready());
  }

  Future<void> _onRefreshDashboard(
    RefreshDashboard event,
    Emitter<DashboardState> emit,
  ) async {
    print('🔵 [DashboardBloc] RefreshDashboard event received');

    // Simulate loading delay
    await Future.delayed(const Duration(milliseconds: 500));

    print('🟢 [DashboardBloc] Dashboard refreshed');
    emit(const DashboardState.ready());
  }
}
