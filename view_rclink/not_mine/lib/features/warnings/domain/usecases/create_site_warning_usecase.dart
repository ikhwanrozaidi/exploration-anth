import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/sync/sync_constants.dart';
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
    final images = params.images != null && params.images!.isNotEmpty
        ? _extractImagesFromPaths(params.images!)
        : null;

    return await _repository.createSiteWarning(
      data: params.data,
      companyUID: params.companyUID,
      images: images,
      adminUID: params.adminUID,
    );
  }

  Map<ImageContextField, List<String>>? _extractImagesFromPaths(
    List<String> imagePaths,
  ) {
    if (imagePaths.isEmpty) return null;

    final result = <ImageContextField, List<String>>{};

    result[ImageContextField.general] = imagePaths;

    print('📷 Extracted ${imagePaths.length} warning images');

    return result;
  }
}

class CreateSiteWarningParams extends Equatable {
  final CreateWarningModel data;
  final String companyUID;
  final List<String>? images;
  final String? adminUID;

  const CreateSiteWarningParams({
    required this.data,
    required this.companyUID,
    this.images,
    this.adminUID,
  });

  @override
  List<Object?> get props => [data, companyUID, images, adminUID];
}
