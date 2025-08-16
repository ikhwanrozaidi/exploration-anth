import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/mailbox_entity.dart';
import '../entities/marketing_entity.dart';

abstract class InboxRepository {
  Future<Either<Failure, List<Marketing>>> getMarketing();
  Future<Either<Failure, List<Mailbox>>> getMailbox();
}