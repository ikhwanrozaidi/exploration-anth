import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../entities/marketing_entity.dart';
import '../repositories/inbox_repository.dart';

@lazySingleton
class GetMarketingUseCase {
  final InboxRepository _repository;

  GetMarketingUseCase(this._repository);

  Future<Either<Failure, List<Marketing>>> call() async {
    return await _repository.getMarketing();
  }
}