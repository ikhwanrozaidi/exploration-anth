import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/transaction_board_data.dart';
import '../../domain/repositories/transaction_board_repository.dart';
import '../datasource/transaction_board_local_datasource.dart';
import '../datasource/transaction_board_remote_datasource.dart';

@LazySingleton(as: TransactionBoardRepository)
class TransactionBoardRepositoryImpl implements TransactionBoardRepository {
  final TransactionBoardRemoteDataSource _remoteDataSource;
  final TransactionBoardLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  TransactionBoardRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, TransactionBoardData>> getUserTransactions() async {
    // Check network connectivity
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      print(
        '📦 [TransactionBoardRepository] No network, loading from cache...',
      );

      // Try to load from cache when offline
      final cacheResult = await _localDataSource.getTransactions();
      return cacheResult.fold((failure) => Left(failure), (data) {
        if (data == null) {
          return const Left(ConnectionFailure());
        }
        return Right(data);
      });
    }

    print('📡 [TransactionBoardRepository] Fetching from API...');

    // Fetch from remote API
    final result = await _remoteDataSource.getUserTransactions();

    return result.fold(
      (failure) {
        print('❌ [TransactionBoardRepository] API failed: ${failure.message}');
        return Left(failure);
      },
      (data) async {
        print('✅ [TransactionBoardRepository] API success, caching data...');

        // Cache the data for offline access
        await _localDataSource.cacheTransactions(data);

        return Right(data);
      },
    );
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      print('🗑️ [TransactionBoardRepository] Clearing cache...');
      return await _localDataSource.clearCache();
    } catch (e) {
      print('❌ [TransactionBoardRepository] Clear cache error: $e');
      return Left(CacheFailure('Failed to clear cache: ${e.toString()}'));
    }
  }
}
