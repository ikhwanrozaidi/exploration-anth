import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/warning.dart';
import '../repositories/warning_repository.dart';

@injectable
class ResolveWarningItemUseCase
    implements UseCase<Warning, ResolveWarningItemParams> {
  final WarningRepository repository;

  ResolveWarningItemUseCase(this.repository);

  @override
  Future<Either<Failure, Warning>> call(ResolveWarningItemParams params) {
    return repository.resolveWarningItem(
      companyUID: params.companyUID,
      warningUID: params.warningUID,
      itemUID: params.itemUID,
      notes: params.notes,
    );
  }
}

class ResolveWarningItemParams extends Equatable {
  final String companyUID;
  final String warningUID;
  final String itemUID;
  final String? notes;

  const ResolveWarningItemParams({
    required this.companyUID,
    required this.warningUID,
    required this.itemUID,
    this.notes,
  });

  @override
  List<Object?> get props => [companyUID, warningUID, itemUID, notes];
}
