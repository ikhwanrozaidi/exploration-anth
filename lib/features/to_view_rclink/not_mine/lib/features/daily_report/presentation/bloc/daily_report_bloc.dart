import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/get_daily_report_usecase.dart';
import '../../domain/usecases/clear_daily_report_cache_usecase.dart';
import 'daily_report_event.dart';
import 'daily_report_state.dart';

@injectable
class DailyReportBloc extends Bloc<DailyReportEvent, DailyReportState> {
  final GetDailyReportsUseCase _getDailyReportsUseCase;
  final ClearDailyReportCacheUseCase _clearDailyReportCacheUseCase;

  DailyReportBloc(
    this._getDailyReportsUseCase,
    this._clearDailyReportCacheUseCase,
  ) : super(const DailyReportInitial()) {
    on<LoadDailyReports>(_onLoadDailyReports);
    on<ClearDailyReportCache>(_onClearCache);
  }

  Future<void> _onLoadDailyReports(
    LoadDailyReports event,
    Emitter<DailyReportState> emit,
  ) async {
    emit(const DailyReportLoading());

    final result = await _getDailyReportsUseCase(
      GetDailyReportsParams(
        companyUID: event.companyUID,
        page: event.page,
        limit: event.limit,
        sortOrder: event.sortOrder,
      ),
    );

    result.fold(
      (failure) => emit(DailyReportFailure(_mapFailureToMessage(failure))),
      (reports) => emit(DailyReportLoaded(reports)),
    );
  }

  Future<void> _onClearCache(
    ClearDailyReportCache event,
    Emitter<DailyReportState> emit,
  ) async {
    final result = await _clearDailyReportCacheUseCase();

    result.fold(
      (failure) => emit(DailyReportFailure(_mapFailureToMessage(failure))),
      (_) {
        emit(const DailyReportInitial());
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server error occurred';
      case CacheFailure:
        return 'Cache error occurred';
      case NetworkFailure:
        return 'Network error occurred';
      case ConnectionFailure:
        return 'No internet connection';
      case NotFoundFailure:
        return 'Data not found';
      case UnauthorizedFailure:
        return 'Unauthorized access';
      default:
        return 'An unexpected error occurred';
    }
  }
}
