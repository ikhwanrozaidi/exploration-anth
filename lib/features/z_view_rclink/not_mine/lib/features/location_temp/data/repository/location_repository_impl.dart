import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repository/location_repository.dart';
import '../datasources/location_local_datasource.dart';

@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final LocationLocalDataSource _localDataSource;

  LocationRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, void>> clearAllLocationCache() async {
    try {
      await _localDataSource.clearAllLocationCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear location cache: $e'));
    }
  }
}
