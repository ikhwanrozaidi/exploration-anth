import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/create_warning_model.dart';
import '../entities/warning.dart';
import '../repositories/warning_repository.dart';

@injectable
class CreateSiteWarningUseCase
    implements UseCase<Warning, CreateSiteWarningParams> {
  final WarningRepository _repository;

  CreateSiteWarningUseCase(this._repository);

  @override
  Future<Either<Failure, Warning>> call(CreateSiteWarningParams params) async {
    return await _repository.createSiteWarning(
      data: params.data,
      companyUID: params.companyUID,
    );
  }
}

/// Parameters for creating a site warning
class CreateSiteWarningParams extends Equatable {
  final CreateWarningModel data;
  final String companyUID;

  const CreateSiteWarningParams({required this.data, required this.companyUID});

  @override
  List<Object?> get props => [data, companyUID];
}
