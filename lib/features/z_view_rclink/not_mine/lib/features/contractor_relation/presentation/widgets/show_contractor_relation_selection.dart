import 'package:flutter/material.dart';
import 'package:rclink_app/features/contractor_relation/presentation/bloc/contractor_relation_state.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';

/// Helper function to show contractor relation selection bottomsheet
///
/// This function can be called from any page that needs contractor selection
/// without needing to include a separate widget.
///
/// Usage:
/// ```dart
/// showContractorRelationSelection(
///   context: context,
///   state: contractorRelationState,
///   onContractorSelected: (selectedData) {
///     // Handle selected contractor data
///     print('Selected UID: ${selectedData['uid']}');
///   },
/// );
/// ```

void showContractorRelationSelection({
  required BuildContext context,
  required ContractorRelationState state,
  required Function(Map<String, dynamic>) onContractorSelected,
}) {
  final contractors = state.maybeWhen(
    loaded: (contractors, selectedContractor) => contractors,
    orElse: () => null,
  );

  // Handle loading state
  if (state is ContractorRelationLoading) {
    CustomSnackBar.show(
      context,
      'Loading contractors...',
      type: SnackBarType.info,
    );
    return;
  }

  // Handle empty or null contractors
  if (contractors == null || contractors.isEmpty) {
    CustomSnackBar.show(
      context,
      'No contractors available',
      type: SnackBarType.warning,
    );
    return;
  }

  // Show bottom sheet with contractors
  showFlexibleBottomsheet(
    context: context,
    title: 'Select Company to Report To',
    attributes: contractors
        .where((contractor) => contractor.name.isNotEmpty)
        .map((contractor) => contractor.name)
        .toList(),
    isRadio: true,
    onSelectionChanged: (selectedName) {
      // Find the selected contractor
      final selectedContractor = contractors.firstWhere(
        (contractor) => contractor.name == selectedName,
      );

      // Prepare data to pass back to caller
      final Map<String, dynamic> selectedData = {
        'companyReportToUID': selectedContractor.uid,
        'name': selectedContractor.name,
        'regNo': selectedContractor.regNo,
        'cidbNo': selectedContractor.cidbNo,
        'address': selectedContractor.address,
        'phone': selectedContractor.phone,
        'email': selectedContractor.email,
        'isSelf': selectedContractor.isSelf,
      };

      // Callback to caller
      onContractorSelected(selectedData);
    },
  );
}
