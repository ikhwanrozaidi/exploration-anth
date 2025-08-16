// lib/features/pay_boarding/features/escrow_pay/domain/usecases/search_seller_usecase.dart
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gatepay_app/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/errors/failures.dart';
import '../entities/seller_info_entity.dart';
import '../repositories/escrow_pay_repository.dart';

@injectable
class SearchUsernameUseCase
    implements UseCase<SellerValidation, SearchUsernameParams> {
  final EscrowPayRepository repository;

  SearchUsernameUseCase(this.repository);

  @override
  Future<Either<Failure, SellerValidation>> call(
    SearchUsernameParams params,
  ) async {
    if (params.username.isEmpty) {
      return const Left(ValidationFailure('Username cannot be empty'));
    }

    return await repository.searchUsername(params.username);
  }
}

@injectable
class SearchPhoneUseCase
    implements UseCase<SellerValidation, SearchPhoneParams> {
  final EscrowPayRepository repository;

  SearchPhoneUseCase(this.repository);

  @override
  Future<Either<Failure, SellerValidation>> call(
    SearchPhoneParams params,
  ) async {
    if (params.phone.isEmpty) {
      return const Left(ValidationFailure('Phone number cannot be empty'));
    }

    return await repository.searchPhone(params.phone);
  }
}

class SearchUsernameParams extends Equatable {
  final String username;

  const SearchUsernameParams(this.username);

  @override
  List<Object?> get props => [username];
}

class SearchPhoneParams extends Equatable {
  final String phone;

  const SearchPhoneParams(this.phone);

  @override
  List<Object?> get props => [phone];
}
