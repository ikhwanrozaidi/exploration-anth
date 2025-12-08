import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../domain/entities/warning.dart';
import '../../domain/repositories/warnings_repository.dart';
import '../datasources/warnings_remote_datasource.dart';
import '../models/create_report_warning_model.dart';

@LazySingleton(as: WarningsRepository)
class WarningsRepositoryImpl implements WarningsRepository {
  final WarningsRemoteDataSource _remoteDataSource;
  final CompanyBloc _companyBloc;

  WarningsRepositoryImpl(
    this._remoteDataSource,
    this._companyBloc,
  );

  @override
  Future<Either<Failure, Warning>> createReportWarning(
    CreateReportWarningModel data,
  ) async {
    // Get selected company UID from CompanyBloc
    final companyState = _companyBloc.state;
    if (companyState is! CompanyLoaded ||
        companyState.selectedCompany == null) {
      return const Left(ServerFailure('No company selected'));
    }

    final companyUID = companyState.selectedCompany!.uid;

    // Call remote datasource to create warning
    final result = await _remoteDataSource.createReportWarning(
      data: data,
      companyUID: companyUID,
    );

    // Convert model to entity if successful
    return result.fold(
      (failure) => Left(failure),
      (warningModel) => Right(warningModel.toEntity()),
    );
  }
}
