import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../warnings/data/models/warning_item_model.dart';
import '../../domain/entities/warning_response.dart';
import 'created_by_response_model.dart';

part 'warning_response_model.freezed.dart';
part 'warning_response_model.g.dart';

@freezed
abstract class WarningResponseModel with _$WarningResponseModel {
  const WarningResponseModel._();

  const factory WarningResponseModel({
    required int id,
    required String uid,
    @Default([]) List<WarningItemModel> warningItems,
    required CreatedByResponseModel createdBy,
    String? description,
    String? longitude,
    String? latitude,
    String? fromSection,
    String? toSection,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _WarningResponseModel;

  factory WarningResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WarningResponseModelFromJson(json);

  WarningResponse toEntity() {
    return WarningResponse(
      id: id,
      uid: uid,
      warningItems: warningItems.map((item) => item.toEntity()).toList(),
      createdBy: createdBy.toEntity(),
      description: description,
      longitude: longitude,
      latitude: latitude,
      fromSection: fromSection,
      toSection: toSection,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
