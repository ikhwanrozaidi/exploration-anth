import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/core/di/injection.dart';
import 'package:rclink_app/features/work_scope/presentation/bloc/work_scope_bloc.dart';
import 'package:rclink_app/features/work_scope/presentation/bloc/work_scope_event.dart';
import 'package:rclink_app/features/work_scope/presentation/bloc/work_scope_state.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/selection_field_card.dart';
import '../widgets/work_scope_bottom_sheet.dart';

class WorkScopeFieldTile extends StatefulWidget {
  final Function(Map<String, dynamic>)? onScopeSelected;

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
            onTap: () {
              showWorkScopeSelection(
                context: context,
                state: state,
                onScopeSelected: (selectedData) {
                  // Update local state
                  setState(() {
                    selectedScopeDisplay = selectedData['displayText'];
                    selectedScopeUID = selectedData['uid'];
                  });

                  // Callback to parent widget if provided
                  widget.onScopeSelected?.call(selectedData);
                },
              );
            },
          );
        },
      ),
    );
  }
}
