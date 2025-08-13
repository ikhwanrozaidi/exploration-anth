import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user_detail.dart';
import '../repositories/dashboard_repository.dart';

@injectable
class GetUserDetailUseCase {
  final DashboardRepository repository;

  GetUserDetailUseCase(this.repository);

  Future<Either<Failure, UserDetail>> call() async {
    return await repository.getUserDetail();
  }
}