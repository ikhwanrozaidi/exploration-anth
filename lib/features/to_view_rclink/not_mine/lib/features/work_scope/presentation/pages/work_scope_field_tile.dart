import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/core/di/injection.dart';
import 'package:rclink_app/features/work_scope/presentation/bloc/work_scope_bloc.dart';
import 'package:rclink_app/features/work_scope/presentation/bloc/work_scope_event.dart';
import 'package:rclink_app/features/work_scope/presentation/bloc/work_scope_state.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../shared/widgets/selection_field_card.dart';

class WorkScopeFieldTile extends StatefulWidget {
  final Function(String workScopeUID, String displayText)? onScopeSelected;

  const WorkScopeFieldTile({Key? key, this.onScopeSelected}) : super(key: key);

  @override
  State<WorkScopeFieldTile> createState() => _WorkScopeFieldTileState();
}

class _WorkScopeFieldTileState extends State<WorkScopeFieldTile> {
  String selectedScopeDisplay = '';
  String? selectedScopeUID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WorkScopeBloc>()
        ..add(
          const WorkScopeEvent.loadWorkScopes(),
        ), // Load work scopes on init
      child: BlocConsumer<WorkScopeBloc, WorkScopeState>(
        listener: (context, state) {
          // Handle errors
          state.maybeWhen(
            error: (failure) {
              CustomSnackBar.show(
                context,
                failure.message.isNotEmpty
                    ? failure.message
                    : 'Failed to load work scopes',
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return SelectionFieldCard(
            icon: Icons.restaurant_menu,
            label: 'Scope of Work',
            value: selectedScopeDisplay,
            placeholder: 'Choose scope of work',
            onTap: () => _showScopeSelection(context, state),
          );
        },
      ),
    );
  }

  void _showScopeSelection(BuildContext context, WorkScopeState state) {
    // Check if work scopes are loaded
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
      title: 'Select Scope of Work',
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

        // Update local state
        setState(() {
          selectedScopeDisplay = selectedName;
          selectedScopeUID = selectedScope.uid;
        });

        // Callback to parent widget if provided
        widget.onScopeSelected?.call(selectedScope.uid, selectedName);

        // Close bottom sheet
        Navigator.of(context).pop();
      },
    );
  }
}
