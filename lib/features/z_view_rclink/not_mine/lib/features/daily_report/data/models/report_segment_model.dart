import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_segment_model.freezed.dart';
part 'report_segment_model.g.dart';

@freezed
abstract class ReportSegmentModel with _$ReportSegmentModel {
  const factory ReportSegmentModel({
    required int id,
    required int reportQuantityID, // Foreign key to ReportQuantities
    required int segmentNumber, // 1, 2, 3... (segment sequence)
    required double startDistance, // 0, 25, 50...
    required double endDistance, // 25, 50, 75...
    required DateTime createdAt,
    required DateTime updatedAt,

    // Sync fields
    @Default(false) bool isSynced,
    DateTime? deletedAt,
    String? syncAction,
    @Default(0) int syncRetryCount,
    String? syncError,
    DateTime? lastSyncAttempt,
  }) = _ReportSegmentModel;

  factory ReportSegmentModel.fromJson(Map<String, dynamic> json) =>
      _$ReportSegmentModelFromJson(json);
}
