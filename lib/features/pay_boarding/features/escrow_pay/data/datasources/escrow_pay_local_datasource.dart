// lib/features/pay_boarding/features/escrow_pay/data/datasources/escrow_pay_local_data_source.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/database/app_database.dart';
import '../../../../../../core/errors/failures.dart';
import '../models/escrow_payment_model.dart';

abstract class EscrowPayLocalDataSource {
  Future<Either<Failure, void>> cachePaymentData(CreatePaymentRequest request);
  Future<Either<Failure, CreatePaymentRequest?>> getLastPaymentData();
  Future<Either<Failure, void>> clearPaymentCache();
}

@LazySingleton(as: EscrowPayLocalDataSource)
class EscrowPayLocalDataSourceImpl implements EscrowPayLocalDataSource {
  final DatabaseService _databaseService;

  EscrowPayLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, void>> cachePaymentData(
    CreatePaymentRequest request,
  ) async {
    try {
      // Using local database to store draft payment data
      // This can be useful for form recovery if user navigates away

      // Note: Since we're using database instead of SharedPreferences,
      // we would need to create a table for draft payments
      // For now, this is a placeholder implementation

      return const Right(null);
    } catch (e) {
      return Left(
        CacheFailure('Failed to cache payment data: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, CreatePaymentRequest?>> getLastPaymentData() async {
    try {
      // Retrieve last cached payment data from database
      // This is using local data for offline capability

      return const Right(null);
    } catch (e) {
      return Left(
        CacheFailure('Failed to get cached payment data: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> clearPaymentCache() async {
    try {
      // Clear cached payment data from database

      return const Right(null);
    } catch (e) {
      return Left(
        CacheFailure('Failed to clear payment cache: ${e.toString()}'),
      );
    }
  }
}
