import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_quantity_value_model.freezed.dart';
part 'report_quantity_value_model.g.dart';

@freezed
abstract class ReportQuantityValueModel with _$ReportQuantityValueModel {
  const factory ReportQuantityValueModel({
    required int id,
    int? reportQuantityID, // For regular quantity entries
    int? segmentID, // For segment entries (R02)
    required int quantityFieldID, // Foreign key to WorkQuantityFields
    required String
    value, // Store all values as string, parse based on fieldType
    required DateTime createdAt,
    required DateTime updatedAt,

    // Sync fields
    @Default(false) bool isSynced,
    DateTime? deletedAt,
    String? syncAction,
    @Default(0) int syncRetryCount,
    String? syncError,
    DateTime? lastSyncAttempt,
  }) = _ReportQuantityValueModel;

  factory ReportQuantityValueModel.fromJson(Map<String, dynamic> json) =>
      _$ReportQuantityValueModelFromJson(json);
}
