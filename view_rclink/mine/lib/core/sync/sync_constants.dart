/// Sync action types for optimistic updates
enum SyncAction {
  create,
  update,
  delete,
  patch;

  /// Convert to string for database storage
  String get value {
    switch (this) {
      case SyncAction.create:
        return 'create';
      case SyncAction.update:
        return 'update';
      case SyncAction.delete:
        return 'delete';
      case SyncAction.patch:
        return 'patch';
    }
  }

  /// Parse from database string
  static SyncAction fromString(String value) {
    return SyncAction.values.firstWhere(
      (action) => action.value == value,
      orElse: () => throw ArgumentError('Unknown sync action: $value'),
    );
  }
}

/// Entity types that can be synced
enum SyncEntityType {
  admin,
  dailyReport,
  company,
  workScope,
  road,
  district,
  province,
  equipment,
  quantity;

  /// Convert to string for database storage (snake_case)
  String get value {
    switch (this) {
      case SyncEntityType.admin:
        return 'admin';
      case SyncEntityType.dailyReport:
        return 'daily_report';
      case SyncEntityType.company:
        return 'company';
      case SyncEntityType.workScope:
        return 'work_scope';
      case SyncEntityType.road:
        return 'road';
      case SyncEntityType.district:
        return 'district';
      case SyncEntityType.province:
        return 'province';
      case SyncEntityType.equipment:
        return 'equipment';
      case SyncEntityType.quantity:
        return 'quantity';
    }
  }

  /// Parse from database string
  static SyncEntityType fromString(String value) {
    return SyncEntityType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw ArgumentError('Unknown entity type: $value'),
    );
  }
}

/// Image context field types matching backend FileContextField enum
enum ImageContextField {
  workersImage,
  beforeImage,
  inprogressImage,
  afterImage,
  general;

  /// Convert to backend enum string (SCREAMING_SNAKE_CASE)
  String get value {
    switch (this) {
      case ImageContextField.workersImage:
        return 'WORKERS_IMAGE';
      case ImageContextField.beforeImage:
        return 'BEFORE_IMAGE';
      case ImageContextField.inprogressImage:
        return 'INPROGRESS_IMAGE';
      case ImageContextField.afterImage:
        return 'AFTER_IMAGE';
      case ImageContextField.general:
        return 'GENERAL';
    }
  }

  /// Parse from backend string
  static ImageContextField fromString(String value) {
    return ImageContextField.values.firstWhere(
      (field) => field.value == value,
      orElse: () => throw ArgumentError('Unknown image context field: $value'),
    );
  }
}

/// Image sync status types
enum ImageSyncStatus {
  draftPending, // Draft images in permanent storage, not yet submitted
  pendingEntitySync, // Waiting for entity (report/inspection/etc.) to sync first
  pendingUpload, // Entity synced, ready to upload
  uploading, // Currently uploading
  synced, // Successfully uploaded
  failed; // Failed after max retries

  /// Convert to string for database storage
  String get value {
    switch (this) {
      case ImageSyncStatus.draftPending:
        return 'draft_pending';
      case ImageSyncStatus.pendingEntitySync:
        return 'pending_entity_sync';
      case ImageSyncStatus.pendingUpload:
        return 'pending_upload';
      case ImageSyncStatus.uploading:
        return 'uploading';
      case ImageSyncStatus.synced:
        return 'synced';
      case ImageSyncStatus.failed:
        return 'failed';
    }
  }

  /// Parse from database string
  static ImageSyncStatus fromString(String value) {
    return ImageSyncStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => throw ArgumentError('Unknown image sync status: $value'),
    );
  }
}
