import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/get_program_detail_usecase.dart';
import 'program_detail_event.dart';
import 'program_detail_state.dart';

@injectable
class ProgramDetailBloc extends Bloc<ProgramDetailEvent, ProgramDetailState> {
  final GetProgramDetailUseCase _getProgramDetailUseCase;

  ProgramDetailBloc(this._getProgramDetailUseCase)
    : super(const ProgramDetailState.initial()) {
    on<LoadProgramDetail>(_onLoadProgramDetail);
    on<RefreshProgramDetail>(_onRefreshProgramDetail);
  }

  Future<void> _onLoadProgramDetail(
    LoadProgramDetail event,
    Emitter<ProgramDetailState> emit,
  ) async {
    print('📄 Loading program detail: ${event.programUID}');
    emit(const ProgramDetailState.loading());

    final result = await _getProgramDetailUseCase(
      GetProgramDetailParams(
        companyUID: event.companyUID,
        programUID: event.programUID,
        forceRefresh: event.forceRefresh,
      ),
    );

    result.fold(
      (failure) {
        print('❌ Failed to load program detail: ${failure.message}');
        emit(ProgramDetailState.failure(failure.message));
      },
      (program) {
        print('✅ Loaded program detail');
        emit(ProgramDetailState.loaded(program: program));
      },
    );
  }

  Future<void> _onRefreshProgramDetail(
    RefreshProgramDetail event,
    Emitter<ProgramDetailState> emit,
  ) async {
    print('🔄 Refreshing program detail');
    add(
      LoadProgramDetail(
        companyUID: event.companyUID,
        programUID: event.programUID,
        forceRefresh: true,
      ),
    );
  }
}
