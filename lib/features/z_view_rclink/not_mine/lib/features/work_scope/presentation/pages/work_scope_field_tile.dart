import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/selection_field_card.dart';
import '../bloc/work_scope_bloc.dart';
import '../bloc/work_scope_event.dart';
import '../bloc/work_scope_state.dart';
import '../widgets/work_scope_bottom_sheet.dart';

class WorkScopeFieldTile extends StatefulWidget {
  final Function(Map<String, dynamic>)? onScopeSelected;

  const WorkScopeFieldTile({super.key, this.onScopeSelected});

  @override
  State<WorkScopeFieldTile> createState() => _WorkScopeFieldTileState();
}

class _WorkScopeFieldTileState extends State<WorkScopeFieldTile> {
  String selectedScopeDisplay = '';
  String? selectedScopeUID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<WorkScopeBloc>()..add(const WorkScopeEvent.loadWorkScopes()),
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
            icon: Icons.work_outline,
            label: 'Scope of Work',
            value: selectedScopeDisplay,
            placeholder: 'Choose scope of work',
            onTap: () {
              showWorkScopeSelection(
                context: context,
                state: state,
                onScopeSelected: (selectedData) {
                  setState(() {
                    selectedScopeDisplay = selectedData['displayText'];
                    selectedScopeUID = selectedData['uid'];
                  });

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
