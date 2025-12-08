import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/package.dart';

part 'package_model.freezed.dart';
part 'package_model.g.dart';

@freezed
abstract class PackageModel with _$PackageModel {
  const PackageModel._();

  const factory PackageModel({
    required int id,
    required String uid,
    required String name,
    String? description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PackageModel;

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);

  Package toEntity() {
    return Package(
      id: id,
      uid: uid,
      name: name,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory PackageModel.fromEntity(Package entity) {
    return PackageModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      description: entity.description,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
