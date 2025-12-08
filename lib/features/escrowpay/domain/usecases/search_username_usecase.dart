import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../entities/search_response.dart';
import '../repository/escrowpay_repository.dart';

class SearchUsernameUseCase
    implements UseCase<SearchResponse, SearchUsernameParams> {
  final EscrowpayRepository repository;

  SearchUsernameUseCase(this.repository);

  @override
  Future<Either<Failure, SearchResponse>> call(
    SearchUsernameParams params,
  ) async {
    if (params.username.isEmpty) {
      return const Left(ValidationFailure('Username cannot be empty'));
    }

    return await repository.searchByUsername(params.username);
  }
}

class SearchUsernameParams extends Equatable {
  final String username;

  const SearchUsernameParams(this.username);

  @override
  List<Object?> get props => [username];
}
