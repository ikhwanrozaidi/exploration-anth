import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/seller_info_entity.dart';

abstract class EscrowpayLocalDataSource {
  Future<Either<Failure, void>> cacheSellerInfo(SellerInfo sellerInfo);
  Future<Either<Failure, SellerInfo?>> getCachedSellerInfo(
    String userIdOrPhone,
  );
  Future<Either<Failure, void>> clearCache();
}

@LazySingleton(as: EscrowpayLocalDataSource)
class EscrowpayLocalDataSourceImpl implements EscrowpayLocalDataSource {
  final DatabaseService _databaseService;

  EscrowpayLocalDataSourceImpl(this._databaseService);

  @override
  Future<Either<Failure, void>> cacheSellerInfo(SellerInfo sellerInfo) async {
    try {
      // For now, we'll store seller info in memory during the session
      // You can extend this to use database if needed
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache seller info: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, SellerInfo?>> getCachedSellerInfo(
    String userIdOrPhone,
  ) async {
    try {
      // Using local data - implement database caching if needed
      return const Right(null);
    } catch (e) {
      return Left(
        CacheFailure('Failed to get cached seller info: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      // Clear cached seller info if any
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: ${e.toString()}'));
    }
  }
}
