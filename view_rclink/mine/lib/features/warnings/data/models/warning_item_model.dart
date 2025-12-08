import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/warning_item.dart';
import 'warning_reason_model.dart';

part 'warning_item_model.freezed.dart';
part 'warning_item_model.g.dart';

@freezed
abstract class WarningItemModel with _$WarningItemModel {
  const WarningItemModel._();

  const factory WarningItemModel({
    required int id,
    required String uid,
    required int warningID,
    required int warningReasonID,
    String? notes,
    @Default(false) bool isCompleted,
    DateTime? completedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    // Optional nested warning reason
    WarningReasonModel? warningReason,
  }) = _WarningItemModel;

  factory WarningItemModel.fromJson(Map<String, dynamic> json) =>
      _$WarningItemModelFromJson(json);

  WarningItem toEntity() {
    return WarningItem(
      id: id,
      uid: uid,
      warningID: warningID,
      warningReasonID: warningReasonID,
      notes: notes,
      isCompleted: isCompleted,
      completedAt: completedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      warningReason: warningReason?.toEntity(),
    );
  }
}
