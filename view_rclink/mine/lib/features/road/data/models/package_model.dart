import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/package_entity.dart';

part 'package_model.freezed.dart';
part 'package_model.g.dart';

@freezed
abstract class PackageModel with _$PackageModel {
  const PackageModel._();

  const factory PackageModel({
    int? id,
    String? uid,
    String? name,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) = _PackageModel;

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);

  /// Convert model -> entity
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

  /// Convert entity -> model
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
