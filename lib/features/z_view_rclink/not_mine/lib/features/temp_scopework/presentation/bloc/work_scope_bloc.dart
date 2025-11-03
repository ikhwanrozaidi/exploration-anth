import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:rclink_app/features/work_scope_temp/domain/usecases/get_workscope_usecase.dart';
import '../../../../core/errors/failures.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import 'work_scope_event.dart';
import 'work_scope_state.dart';

@injectable
class WorkScopeBloc extends Bloc<WorkScopeEvent, WorkScopeState> {
  // Fetch companyUID
  final CompanyBloc _companyBloc;
  StreamSubscription<CompanyState>? _companySubscription;
  String? _currentCompanyUID;

  // Usecase here
  final GetWorkScopesUseCase _getWorkScopesUseCase;

  WorkScopeBloc(this._getWorkScopesUseCase, this._companyBloc)
    : super(const WorkScopeState.initial()) {
    _setupCompanyListener();

    on<LoadWorkScopes>(_onLoadWorkScopes);
  }

  void _setupCompanyListener() {
    _companySubscription = _companyBloc.stream.listen((companyState) {
      if (companyState is CompanyLoaded &&
          companyState.selectedCompany != null) {
        _currentCompanyUID = companyState.selectedCompany!.uid;
      } else {
        _currentCompanyUID = null;
      }
    });

    final currentState = _companyBloc.state;
    if (currentState is CompanyLoaded && currentState.selectedCompany != null) {
      _currentCompanyUID = currentState.selectedCompany!.uid;
    }
  }

  Either<Failure, String> _getValidatedCompanyUID() {
    if (_currentCompanyUID == null || _currentCompanyUID!.isEmpty) {
      return const Left(ServerFailure('Please select a company first'));
    }
    return Right(_currentCompanyUID!);
  }

  Future<void> _onLoadWorkScopes(
    LoadWorkScopes event,
    Emitter<WorkScopeState> emit,
  ) async {
    emit(const WorkScopeState.loading());

    // Validate companyUID
    final companyUIDResult = _getValidatedCompanyUID();
    if (companyUIDResult.isLeft()) {
      emit(
        WorkScopeState.error(
          companyUIDResult.fold((failure) => failure, (_) => throw Exception()),
        ),
      );
      return;
    }
    final companyUID = companyUIDResult.getOrElse(() => '');

    final result = await _getWorkScopesUseCase(
      GetWorkScopesParams(
        companyUID: companyUID,
        search: event.search,
        code: event.code,
        allowMultipleQuantities: event.allowMultipleQuantities,
        expand: event.expand,

        forceRefresh: event.forceRefresh,
        cacheTimeout: event.cacheTimeout,
      ),
    );

    result.fold(
      (failure) => emit(WorkScopeState.error(failure)),
      (workScopes) => emit(WorkScopeState.loaded(workScopes)),
    );
  }

  @override
  Future<void> close() {
    _companySubscription?.cancel();
    return super.close();
  }
}
