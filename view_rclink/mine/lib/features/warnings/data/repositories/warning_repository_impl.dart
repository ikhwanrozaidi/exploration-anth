import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../domain/entities/warning.dart';
import '../../domain/repositories/warning_repository.dart';
import '../datasources/warnings_local_datasource.dart';
import '../datasources/warnings_remote_datasource.dart';
import '../models/create_report_warning_model.dart';

@LazySingleton(as: WarningRepository)
class WarningRepositoryImpl implements WarningRepository {
  final WarningsRemoteDataSource _remoteDataSource;
  final WarningsLocalDataSource _localDataSource;
  final CompanyBloc _companyBloc;

  WarningRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._companyBloc,
  );

  @override
  Future<Either<Failure, List<Warning>>> getWarnings({
    required String companyUID,
    int page = 1,
    int limit = 50,
    String sortOrder = 'desc',
    List<String>? warningType,
    String? roadUID,
    String? workScopeUID,
    String? contractRelationUID,
    String? dailyReportUID,
    bool? isResolved,
    bool? requiresAction,
  }) async {
    final remoteResult = await _remoteDataSource.getWarnings(
      companyUID: companyUID,
      page: page,
      limit: limit,
      sortOrder: sortOrder,
      warningType: warningType,
      roadUID: roadUID,
      workScopeUID: workScopeUID,
      contractRelationUID: contractRelationUID,
      dailyReportUID: dailyReportUID,
      isResolved: isResolved,
      requiresAction: requiresAction,
    );

    return remoteResult.fold(
      (failure) async {
        // Offline-first: fallback to local data source on remote failure
        final localWarnings = await _localDataSource.getCachedWarnings(
          companyUID,
        );

        if (localWarnings != null && localWarnings.isNotEmpty) {
          return Right(localWarnings.map((model) => model.toEntity()).toList());
        }

        return Left(failure);
      },
      (models) async {
        // Cache in background without blocking UI update
        unawaited(_localDataSource.cacheWarnings(models));

        return Right(models.map((model) => model.toEntity()).toList());
      },
    );
  }

  @override
  Future<Either<Failure, Warning>> getWarningById({
    required String companyUID,
    required String uid,
    bool forceRefresh = false,
  }) async {
    try {
      // Try to get from cache first if not forcing refresh
      if (!forceRefresh) {
        final cachedWarning = await _localDataSource.getCachedWarningByUid(uid);
        if (cachedWarning != null) {
          return Right(cachedWarning.toEntity());
        }
      }

      // Fetch from remote
      final remoteResult = await _remoteDataSource.getWarningById(
        companyUID: companyUID,
        uid: uid,
      );

      return remoteResult.fold(
        (failure) async {
          // On failure, try cache as fallback
          final cachedWarning = await _localDataSource.getCachedWarningByUid(
            uid,
          );
          if (cachedWarning != null) {
            return Right(cachedWarning.toEntity());
          }
          return Left(failure);
        },
        (model) async {
          // Cache the fetched model
          await _localDataSource.cacheSingleWarning(model);
          return Right(model.toEntity());
        },
      );
    } catch (e) {
      return Left(CacheFailure('Failed to get warning: $e'));
    }
  }

  @override
  Future<Either<Failure, Warning>> createReportWarning({
    required String companyUID,
    required String dailyReportUID,
    required List<String> warningReasonUIDs,
    String? description,
  }) async {
    final currentState = _companyBloc.state;

    if (currentState is! CompanyLoaded ||
        currentState.selectedCompany == null) {
      return const Left(ServerFailure('No company selected'));
    }

    final createModel = CreateReportWarningModel(
      dailyReportUID: dailyReportUID,
      warningReasonUIDs: warningReasonUIDs,
      description: description,
    );

    final result = await _remoteDataSource.createReportWarning(
      companyUID: companyUID,
      data: createModel,
    );

    return result.fold((failure) => Left(failure), (model) async {
      // Cache the created warning
      await _localDataSource.cacheSingleWarning(model);
      return Right(model.toEntity());
    });
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: $e'));
    }
  }
}
