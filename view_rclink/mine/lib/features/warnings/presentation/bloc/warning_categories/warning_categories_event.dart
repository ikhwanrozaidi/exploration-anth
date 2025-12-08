import 'package:freezed_annotation/freezed_annotation.dart';

part 'warning_categories_event.freezed.dart';

@freezed
abstract class WarningCategoriesEvent with _$WarningCategoriesEvent {
  const factory WarningCategoriesEvent.loadCategories({
    @Default(false) bool forceRefresh,
    Duration? cacheTimeout,
    String? warningType,
    String? workScopeUID,
  }) = LoadWarningCategories;
}
