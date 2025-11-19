import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/warning_categories_repository.dart';

part 'warning_categories_state.freezed.dart';

@freezed
class WarningCategoriesState with _$WarningCategoriesState {
  const factory WarningCategoriesState.initial() = WarningCategoriesInitial;
  const factory WarningCategoriesState.loading() = WarningCategoriesLoading;
  const factory WarningCategoriesState.loaded(
    List<WarningCategoryWithReasons> categories,
  ) = WarningCategoriesLoaded;
  const factory WarningCategoriesState.error(Failure failure) =
      WarningCategoriesError;
}
