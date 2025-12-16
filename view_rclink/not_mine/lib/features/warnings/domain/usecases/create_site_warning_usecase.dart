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
    // Extract images from params if provided
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

  /// Extract images from image paths and convert to ImageContextField map
  Map<ImageContextField, List<String>>? _extractImagesFromPaths(
    List<String> imagePaths,
  ) {
    if (imagePaths.isEmpty) return null;

    final result = <ImageContextField, List<String>>{};

    // All warning images go to GENERAL context field
    result[ImageContextField.general] = imagePaths;

    print('📷 Extracted ${imagePaths.length} warning images');

    return result;
  }
}

/// Parameters for creating a site warning
class CreateSiteWarningParams extends Equatable {
  final CreateWarningModel data;
  final String companyUID;
  final List<String>? images; // Image file paths
  final String? adminUID; // For image upload tracking

  const CreateSiteWarningParams({
    required this.data,
    required this.companyUID,
    this.images,
    this.adminUID,
  });

  @override
  List<Object?> get props => [data, companyUID, images, adminUID];
}
