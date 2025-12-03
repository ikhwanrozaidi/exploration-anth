/// Model representing the sync status of images for a specific entity
class ImageSyncStatusModel {
  final String entityUID;
  final String entityType;
  final int totalImages;
  final int pendingCount;
  final int syncedCount;
  final int failedCount;
  final int uploadingCount;

  const ImageSyncStatusModel({
    required this.entityUID,
    required this.entityType,
    required this.totalImages,
    required this.pendingCount,
    required this.syncedCount,
    required this.failedCount,
    required this.uploadingCount,
  });

  /// Whether there are any images pending sync
  bool get hasPending => pendingCount > 0;

  /// Whether there are any failed images
  bool get hasFailed => failedCount > 0;

  /// Whether all images are synced
  bool get isFullySynced => syncedCount == totalImages && totalImages > 0;

  /// Whether images are currently uploading
  bool get isUploading => uploadingCount > 0;

  /// Whether any sync operation is needed
  bool get needsSync => hasPending || hasFailed || isUploading;

  /// User-friendly status message
  String get statusMessage {
    if (totalImages == 0) return 'No images';
    if (isFullySynced) return '✓ All images synced';
    if (isUploading) return 'Uploading images...';
    if (hasFailed) return '⚠️ $failedCount failed';
    if (hasPending) return '⏳ $pendingCount pending';
    return 'Unknown status';
  }

  @override
  String toString() {
    return 'ImageSyncStatusModel('
        'entityUID: $entityUID, '
        'entityType: $entityType, '
        'total: $totalImages, '
        'pending: $pendingCount, '
        'synced: $syncedCount, '
        'failed: $failedCount, '
        'uploading: $uploadingCount)';
  }
}
