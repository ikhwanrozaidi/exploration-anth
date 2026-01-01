import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/failures.dart';
import '../../domain/entities/transaction_board_data.dart';
import 'transaction_board_api_service.dart';

abstract class TransactionBoardRemoteDataSource {
  Future<Either<Failure, TransactionBoardData>> getUserTransactions();
}

@LazySingleton(as: TransactionBoardRemoteDataSource)
class TransactionBoardRemoteDataSourceImpl
    implements TransactionBoardRemoteDataSource {
  final TransactionBoardApiService _apiService;

  TransactionBoardRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, TransactionBoardData>> getUserTransactions() async {
    try {
      print(
        '🌐 [TransactionBoardRemoteDataSource] Calling getUserTransactions API...',
      );

      final response = await _apiService.getUserTransactions();

      if (response.isSuccess && response.data != null) {
        print('✅ [TransactionBoardRemoteDataSource] API call successful');
        print('✅ Found ${response.data!.transactions.length} transactions');

        return Right(response.data!.toEntity());
      } else {
        print(
          '❌ [TransactionBoardRemoteDataSource] API failed: ${response.message}',
        );
        return Left(
          ServerFailure(
            response.message.isEmpty
                ? 'Failed to fetch transactions'
                : response.message,
            statusCode: response.statusCode,
          ),
        );
      }
    } catch (e, stackTrace) {
      print('❌ [TransactionBoardRemoteDataSource] Error: $e');
      print('❌ StackTrace: $stackTrace');
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
