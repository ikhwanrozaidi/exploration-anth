import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../domain/usecases/get_my_companies_usecase.dart';
import '../../domain/usecases/select_company_usecase.dart';
import '../../domain/usecases/get_selected_company_usecase.dart';
import 'company_event.dart';
import 'company_state.dart';

@injectable
class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final GetMyCompaniesUseCase _getMyCompaniesUseCase;
  final SelectCompanyUseCase _selectCompanyUseCase;
  final GetSelectedCompanyUseCase _getSelectedCompanyUseCase;
  final AuthBloc _authBloc;

  CompanyBloc(
    this._getMyCompaniesUseCase,
    this._selectCompanyUseCase,
    this._getSelectedCompanyUseCase,
    this._authBloc,
  ) : super(const CompanyInitial()) {
    on<LoadCompanies>(_onLoadCompanies);
    on<SelectCompany>(_onSelectCompany);
    on<ClearSelection>(_onClearSelection);
  }

  Future<void> _onLoadCompanies(
    LoadCompanies event,
    Emitter<CompanyState> emit,
  ) async {
    emit(const CompanyLoading());

    final result = await _getMyCompaniesUseCase();

    result.fold(
      (failure) => emit(CompanyFailure(_mapFailureToMessage(failure))),
      (companies) async {
        // Check if there's a previously selected company
        final selectedResult = await _getSelectedCompanyUseCase();
        final selectedCompanyId = selectedResult.getOrElse(() => null);

        emit(CompanyLoaded(companies, selectedCompanyId: selectedCompanyId));
      },
    );
  }

  Future<void> _onSelectCompany(
    SelectCompany event,
    Emitter<CompanyState> emit,
  ) async {
    final currentState = state;
    if (currentState is CompanyLoaded) {
      final result = await _selectCompanyUseCase(
        SelectCompanyParams(companyId: event.companyId),
      );

      result.fold(
        (failure) => emit(CompanyFailure(_mapFailureToMessage(failure))),
        (_) {
          // Update the state with selected company
          emit(
            CompanyLoaded(
              currentState.companies,
              selectedCompanyId: event.companyId,
            ),
          );

          // Notify auth bloc that company has been selected
          _authBloc.add(CompanySelected(event.companyId));
        },
      );
    }
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
