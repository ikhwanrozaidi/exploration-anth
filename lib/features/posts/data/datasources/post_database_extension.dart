import 'dart:developer';
import '../../../../../core/database/app_database.dart';
import '../../domain/entities/post.dart';

/// Extension to convert PostRecord database entity to Post domain entity
extension PostRecordToDomain on PostRecord {
  Post toEntity() {
    // print('------PostRecordToDomain.toEntity called');
    return Post(
      id: id,
      userId: userId,
      title: title,
      body: body,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isSynced: isSynced,
    );
  }

  /// Check if this record needs to be synced to server
  bool get needsSync => !isSynced && deletedAt == null;

  /// Check if this record is marked for deletion
  bool get isDeleted => deletedAt != null;

  /// Check if this record has sync errors
  bool get hasSyncError => syncError != null;
}
