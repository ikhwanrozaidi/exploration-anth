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
