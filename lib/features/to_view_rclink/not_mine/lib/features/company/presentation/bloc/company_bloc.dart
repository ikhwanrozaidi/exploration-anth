import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/core/di/injection.dart';
import 'package:rclink_app/features/rbac/presentation/bloc/rbac_bloc.dart';
import 'package:rclink_app/features/rbac/presentation/bloc/rbac_event.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/get_my_companies_usecase.dart';
import '../../domain/usecases/select_company_usecase.dart';
import '../../domain/usecases/get_selected_company_usecase.dart';
import 'company_event.dart';
import 'company_state.dart';

@lazySingleton
class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final GetMyCompaniesUseCase _getMyCompaniesUseCase;
  final SelectCompanyUseCase _selectCompanyUseCase;
  final GetSelectedCompanyUseCase _getSelectedCompanyUseCase;

  CompanyBloc(
    this._getMyCompaniesUseCase,
    this._selectCompanyUseCase,
    this._getSelectedCompanyUseCase,
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

    await result.fold(
      (failure) async => emit(CompanyFailure(_mapFailureToMessage(failure))),
      (companies) async {
        final selectedResult = await _getSelectedCompanyUseCase();
        final selectedCompanyId = selectedResult.getOrElse(() => null);

        if (!emit.isDone) {
          emit(CompanyLoaded(companies, selectedCompany: null));
        }
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
          // Find the selected company to get its adminRole UID
          final selectedCompany = currentState.companies.firstWhere(
            (c) => c.uid == event.companyId,
            orElse: () => currentState.companies.first,
          );

          // Load role and permissions for the selected company
          final rbacBloc = getIt<RbacBloc>();
          rbacBloc.add(LoadPermissions(selectedCompany.adminRole!.uid));

          emit(
            CompanyLoaded(
              currentState.companies,
              selectedCompany: selectedCompany,
            ),
          );
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
      emit(CompanyLoaded(currentState.companies, selectedCompany: null));
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