import 'package:freezed_annotation/freezed_annotation.dart';

part 'warning_event.freezed.dart';

@freezed
class WarningEvent with _$WarningEvent {
  const factory WarningEvent.loadWarnings({
    required String companyUID,
    @Default(1) int page,
    @Default(50) int limit,
    @Default('desc') String sortOrder,
    List<String>? warningType,
    String? roadUID,
    String? workScopeUID,
    String? contractRelationUID,
    String? dailyReportUID,
    bool? isResolved,
    bool? requiresAction,
  }) = LoadWarnings;

  const factory WarningEvent.loadMoreWarnings({
    required String companyUID,
    required int nextPage,
    @Default(50) int limit,
    @Default('desc') String sortOrder,
    List<String>? warningType,
    String? roadUID,
    String? workScopeUID,
    String? contractRelationUID,
    String? dailyReportUID,
    bool? isResolved,
    bool? requiresAction,
  }) = LoadMoreWarnings;

  const factory WarningEvent.refreshWarnings({
    required String companyUID,
    @Default(1) int page,
    @Default(50) int limit,
    @Default('desc') String sortOrder,
    List<String>? warningType,
    String? roadUID,
    String? workScopeUID,
    String? contractRelationUID,
    String? dailyReportUID,
    bool? isResolved,
    bool? requiresAction,
  }) = RefreshWarnings;

  const factory WarningEvent.clearWarningCache() = ClearWarningCache;
}
