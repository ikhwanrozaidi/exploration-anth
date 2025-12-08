import 'package:freezed_annotation/freezed_annotation.dart';
import 'warning_model.dart';

part 'warning_list_response_model.freezed.dart';
part 'warning_list_response_model.g.dart';

@freezed
abstract class WarningListResponseModel with _$WarningListResponseModel {
  const factory WarningListResponseModel({
    required int statusCode,
    required String message,
    required List<WarningModel> data,
    required WarningMetaModel meta,
  }) = _WarningListResponseModel;

  factory WarningListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WarningListResponseModelFromJson(json);
}

@freezed
abstract class WarningMetaModel with _$WarningMetaModel {
  const factory WarningMetaModel({
    required int page,
    required int limit,
    required int totalCount,
    required int totalPages,
    required bool hasNext,
    required bool hasPrev,
  }) = _WarningMetaModel;

  factory WarningMetaModel.fromJson(Map<String, dynamic> json) =>
      _$WarningMetaModelFromJson(json);
}
