import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../models/marketing_model.dart';
import '../models/mailbox_model.dart';
import 'inbox_api_service.dart';

abstract class InboxRemoteDataSource {
  Future<Either<Failure, List<MarketingModel>>> getMarketing();
  Future<Either<Failure, List<MailboxModel>>> getMailbox();
}

@LazySingleton(as: InboxRemoteDataSource)
class InboxRemoteDataSourceImpl implements InboxRemoteDataSource {
  final InboxApiService _apiService;

  InboxRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<MarketingModel>>> getMarketing() async {
    try {
      final response = await _apiService.getMarketing();

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Get marketing failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<MailboxModel>>> getMailbox() async {
    try {
      final response = await _apiService.getMailbox();

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Get mailbox failed: ${e.toString()}'));
    }
  }
}