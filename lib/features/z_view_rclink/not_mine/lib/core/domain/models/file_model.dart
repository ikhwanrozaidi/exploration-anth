import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/file_entity.dart';
import '../../database/app_database.dart';

part 'file_model.freezed.dart';
part 'file_model.g.dart';

@freezed
abstract class FileModel with _$FileModel {
  const FileModel._();

  const factory FileModel({
    required int id,
    required String uid,
    required String fileName,
    required String s3Url,
    required String mimeType,
    required int size,
    int? sequence,
    required int companyID,
    required String contextType,
    String? contextField,
    required int uploadedByID,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default(false) bool isSynced,
    DateTime? deletedAt,
    String? syncAction,
    @Default(0) int syncRetryCount,
    String? syncError,
    DateTime? lastSyncAttempt,
  }) = _FileModel;

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);

  FileEntity toEntity() {
    return FileEntity(
      id: id,
      uid: uid,
      fileName: fileName,
      s3Url: s3Url,
      mimeType: mimeType,
      size: size,
      sequence: sequence,
      companyID: companyID,
      contextType: contextType,
      contextField: contextField,
      uploadedByID: uploadedByID,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory FileModel.fromEntity(FileEntity entity) {
    return FileModel(
      id: entity.id,
      uid: entity.uid,
      fileName: entity.fileName,
      s3Url: entity.s3Url,
      mimeType: entity.mimeType,
      size: entity.size,
      sequence: entity.sequence,
      companyID: entity.companyID,
      contextType: entity.contextType,
      contextField: entity.contextField,
      uploadedByID: entity.uploadedByID,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  factory FileModel.fromDatabaseRecord(FileRecord record) {
    return FileModel(
      id: record.id,
      uid: record.uid,
      fileName: record.fileName,
      s3Url: record.s3Url,
      mimeType: record.mimeType,
      size: record.size,
      sequence: record.sequence,
      companyID: record.companyID,
      contextType: record.contextType,
      contextField: record.contextField,
      uploadedByID: record.uploadedByID,
      createdAt: record.createdAt,
      updatedAt: record.updatedAt,
      isSynced: record.isSynced,
      deletedAt: record.deletedAt,
      syncAction: record.syncAction,
      syncRetryCount: record.syncRetryCount,
      syncError: record.syncError,
      lastSyncAttempt: record.lastSyncAttempt,
    );
  }
}
