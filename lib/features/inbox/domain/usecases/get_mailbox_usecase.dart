import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../entities/mailbox_entity.dart';
import '../repositories/inbox_repository.dart';

@lazySingleton
class GetMailboxUseCase {
  final InboxRepository _repository;

  GetMailboxUseCase(this._repository);

  Future<Either<Failure, List<Mailbox>>> call() async {
    return await _repository.getMailbox();
  }
}