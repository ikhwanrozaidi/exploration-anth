import 'package:equatable/equatable.dart';
import 'warning_reason.dart';

class WarningItem extends Equatable {
  final int id;
  final String uid;
  final int warningID;
  final int warningReasonID;
  final String? notes;
  final bool isCompleted;
  final DateTime? completedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Optional nested warning reason entity
  final WarningReason? warningReason;

  const WarningItem({
    required this.id,
    required this.uid,
    required this.warningID,
    required this.warningReasonID,
    this.notes,
    required this.isCompleted,
    this.completedAt,
    required this.createdAt,
    required this.updatedAt,
    this.warningReason,
  });

  @override
  List<Object?> get props => [
        id,
        uid,
        warningID,
        warningReasonID,
        notes,
        isCompleted,
        completedAt,
        createdAt,
        updatedAt,
        warningReason,
      ];
}
