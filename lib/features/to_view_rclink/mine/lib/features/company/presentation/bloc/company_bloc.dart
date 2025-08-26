import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../domain/entities/company.dart';
import '../../domain/usecases/get_my_companies_usecase.dart';
import '../../domain/usecases/select_company_usecase.dart';
import '../../domain/usecases/get_selected_company_usecase.dart';
import '../../domain/usecases/get_role_usecase.dart';
import 'company_event.dart';
import 'company_state.dart';

@injectable
class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final GetMyCompaniesUseCase _getMyCompaniesUseCase;
  final SelectCompanyUseCase _selectCompanyUseCase;
  final GetSelectedCompanyUseCase _getSelectedCompanyUseCase;
  final GetRoleUseCase _getRoleUseCase;
  final AuthBloc _authBloc;

  CompanyBloc(
    this._getMyCompaniesUseCase,
    this._selectCompanyUseCase,
    this._getSelectedCompanyUseCase,
    this._getRoleUseCase,
    this._authBloc,
  ) : super(const CompanyInitial()) {
    on<LoadCompanies>(_onLoadCompanies);
    on<SelectCompany>(_onSelectCompany);
    on<ClearSelection>(_onClearSelection);
    on<FetchRole>(_onFetchRole);
  }

  Future<void> _onLoadCompanies(
    LoadCompanies event,
    Emitter<CompanyState> emit,
  ) async {
    emit(const CompanyLoading());

    final result = await _getMyCompaniesUseCase();

    await result.fold(
      (failure) async => emit(CompanyFailure(_mapFailureToMessage(failure))),
      (companies) async {
        final selectedResult = await _getSelectedCompanyUseCase();
        final selectedCompanyId = selectedResult.getOrElse(() => null);

        if (!emit.isDone) {
          emit(CompanyLoaded(companies, selectedCompanyId: selectedCompanyId));
        }
      },
    );
  }

  Future<void> _onSelectCompany(
    SelectCompany event,
    Emitter<CompanyState> emit,
  ) async {
    List<Company>? companies;
    String? selectedCompanyId;

    state.whenOrNull(
      loaded: (companiesList, currentSelectedId) {
        companies = companiesList;
        selectedCompanyId = currentSelectedId;
      },
    );

    final result = await _selectCompanyUseCase(
      SelectCompanyParams(companyId: event.companyId),
    );

    result.fold(
      (failure) {
        emit(CompanyFailure(_mapFailureToMessage(failure)));
      },
      (_) {
        if (companies != null) {
          emit(CompanyLoaded(companies!, selectedCompanyId: event.companyId));
        }

        _authBloc.add(CompanySelected(event.companyId));
      },
    );
  }

  Future<void> _onClearSelection(
    ClearSelection event,
    Emitter<CompanyState> emit,
  ) async {
    final currentState = state;
    if (currentState is CompanyLoaded) {
      emit(CompanyLoaded(currentState.companies, selectedCompanyId: null));
    }
  }

  Future<void> _onFetchRole(FetchRole event, Emitter<CompanyState> emit) async {
    emit(const CompanyRoleLoading());

    final result = await _getRoleUseCase(GetRoleParams(roleUid: event.roleUid));

    await result.fold(
      (failure) async {
        if (!emit.isDone) {
          emit(CompanyRoleFailure(_mapFailureToMessage(failure)));
        }
      },
      (role) async {
        await Future.delayed(const Duration(seconds: 1));

        if (!emit.isDone) {
          emit(CompanyRoleLoaded(role));
        } else {
          print('⚠️ CompanyBloc: Event handler completed, skipping emit');
        }
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ConnectionFailure:
        return 'No internet connection. Showing cached companies.';
      case NetworkFailure:
        return 'Network error. Please try again.';
      case ServerFailure:
        return failure.message;
      case UnauthorizedFailure:
        return 'Authentication failed. Please login again.';
      default:
        return failure.message.isEmpty
            ? 'An unexpected error occurred. Please try again.'
            : failure.message;
    }
  }
}
