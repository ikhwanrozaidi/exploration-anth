import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/company_repository.dart';

@injectable
class ClearCompanyCacheUseCase implements UseCaseNoParams<void> {
  final CompanyRepository _repository;

  ClearCompanyCacheUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await _repository.clearCache();
  }
}
