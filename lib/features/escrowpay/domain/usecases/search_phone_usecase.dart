import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/search_response.dart';
import '../repository/escrowpay_repository.dart';

class SearchPhoneUseCase implements UseCase<SearchResponse, SearchPhoneParams> {
  final EscrowpayRepository repository;

  SearchPhoneUseCase(this.repository);

  @override
  Future<Either<Failure, SearchResponse>> call(SearchPhoneParams params) async {
    if (params.phone.isEmpty) {
      return const Left(ValidationFailure('Phone number cannot be empty'));
    }

    return await repository.searchByPhone(params.phone);
  }
}

class SearchPhoneParams extends Equatable {
  final String phone;

  const SearchPhoneParams(this.phone);

  @override
  List<Object?> get props => [phone];
}
