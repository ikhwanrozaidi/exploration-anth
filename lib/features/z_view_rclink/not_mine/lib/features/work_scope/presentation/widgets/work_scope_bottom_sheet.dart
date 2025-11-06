import 'package:flutter/material.dart';
import '../bloc/work_scope_state.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';

/// Helper function to show work scope selection bottomsheet
///
/// Usage:
/// ```dart
/// showWorkScopeSelection(
///   context: context,
///   state: workScopeState,
///   onScopeSelected: (selectedData) {
///     print('Selected UID: ${selectedData['uid']}');
///   },
/// );
/// ```
void showWorkScopeSelection({
  required BuildContext context,
  required WorkScopeState state,
  required Function(Map<String, dynamic>) onScopeSelected,
}) {
  final workScopes = state.maybeWhen(
    loaded: (workScopes) => workScopes,
    orElse: () => null,
  );

  // Handle loading state
  if (state is WorkScopeLoading) {
    CustomSnackBar.show(context, 'Loading work scopes...');
    return;
  }

  // Handle empty or null work scopes
  if (workScopes == null || workScopes.isEmpty) {
    CustomSnackBar.show(context, 'No work scopes available');
    return;
  }

  // Show bottom sheet with work scopes
  showFlexibleBottomsheet(
    context: context,
    title: 'Scope of Work',
    attributes: workScopes
        .where((scope) => scope.name.isNotEmpty)
        .map((scope) => '${scope.code} - ${scope.name}')
        .toList(),
    isRadio: true,
    onSelectionChanged: (selectedName) {
      // Find the selected scope
      final selectedScope = workScopes.firstWhere(
        (scope) => '${scope.code} - ${scope.name}' == selectedName,
      );

      // Prepare data to pass back to caller
      final Map<String, dynamic> selectedData = {
        'uid': selectedScope.uid,
        'displayText': selectedName,
        'code': selectedScope.code,
        'name': selectedScope.name,
        'description': selectedScope.description,
        'allowMultipleQuantities': selectedScope.allowMultipleQuantities,
        'workQuantityTypes': selectedScope.workQuantityTypes,
        'workEquipments': selectedScope.workEquipments,
      };

      // Callback to caller
      onScopeSelected(selectedData);
    },
  );
}
