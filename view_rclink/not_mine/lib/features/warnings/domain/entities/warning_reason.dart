import 'package:equatable/equatable.dart';
import 'warning_type.dart';
import 'warning_category.dart';

class WarningReason extends Equatable {
  final int id;
  final String uid;
  final String name;
  final WarningType warningType;
  final int categoryID;
  final int workScopeID;
  final bool requiresAction;
  final bool isActive;
  final int displayOrder;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Optional nested category entity
  final WarningCategory? category;

  const WarningReason({
    required this.id,
    required this.uid,
    required this.name,
    required this.warningType,
    required this.categoryID,
    required this.workScopeID,
    required this.requiresAction,
    required this.isActive,
    required this.displayOrder,
    required this.createdAt,
    required this.updatedAt,
    this.category,
  });

  @override
  List<Object?> get props => [
        id,
        uid,
        name,
        warningType,
        categoryID,
        workScopeID,
        requiresAction,
        isActive,
        displayOrder,
        createdAt,
        updatedAt,
        category,
      ];
}
