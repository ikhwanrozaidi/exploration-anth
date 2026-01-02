import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/seller_validation_entity.dart';
import '../repositories/escrowpay_repository.dart';

@lazySingleton
class SearchSellerUseCase
    implements UseCase<SellerValidationEntity, SearchSellerParams> {
  final EscrowpayRepository _repository;

  SearchSellerUseCase(this._repository);

  @override
  Future<Either<Failure, SellerValidationEntity>> call(
    SearchSellerParams params,
  ) async {
    // Validation - at least one identifier must be provided
    if ((params.username == null || params.username!.isEmpty) &&
        (params.phone == null || params.phone!.isEmpty)) {
      return const Left(
        ValidationFailure('Either username or phone must be provided'),
      );
    }

    return _repository.searchUser(
      username: params.username,
      phone: params.phone,
    );
  }
}

class SearchSellerParams {
  final String? username;
  final String? phone;

  SearchSellerParams({this.username, this.phone});
}
