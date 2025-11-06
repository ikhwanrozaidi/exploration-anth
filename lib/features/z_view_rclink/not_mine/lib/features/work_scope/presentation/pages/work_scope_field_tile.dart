import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/selection_field_card.dart';
import '../bloc/work_scope_bloc.dart';
import '../bloc/work_scope_state.dart';
import '../widgets/work_scope_bottom_sheet.dart';

/*
  HOW TO USE:

  WorkScopeFieldTile(
    onScopeSelected: (Map<String, dynamic> selectedData) {
      print('Selected UID: ${selectedData['uid']}');
      print('Code: ${selectedData['code']}');
      print('Name: ${selectedData['name']}');
      print(
        'Description: ${selectedData['description']}',
      );
      print(
        'Allow Multiple Quantities: ${selectedData['allowMultipleQuantities']}',
      );

      List workQuantityTypes =
          selectedData['workQuantityTypes'];
      List workEquipments =
          selectedData['workEquipments'];

      // Store in your state
      // setState(() {
      //   _selectedWorkScopeUid = selectedData['uid'];
      //   _selectedWorkScopeName = selectedData['displayText'];
      // });
    },
  ),
*/

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
    return BlocConsumer<WorkScopeBloc, WorkScopeState>(
      listener: (context, state) {
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
          imagePath: 'assets/images/icons/scope_of_work.png',
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
    );
  }
}
