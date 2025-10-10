import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/di/injection.dart';
import '../../../../../../shared/utils/responsive_helper.dart';
import '../../../../../../shared/utils/theme.dart';
import '../../../../../daily_report_creation/domain/entities/scope_of_work/work_equipment.dart';
import '../../../../domain/entities/daily_report_response.dart';
import '../../../bloc/daily_report_bloc.dart';
import '../../../bloc/daily_report_event.dart';
import '../../../bloc/daily_report_state.dart';

class EquipmentEditPage extends StatefulWidget {
  final DailyReportResponse report;

  const EquipmentEditPage({Key? key, required this.report}) : super(key: key);

  @override
  State<EquipmentEditPage> createState() => _EquipmentEditPageState();
}

class _EquipmentEditPageState extends State<EquipmentEditPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildEquipmentButton(
    String equipmentName,
    bool isSelected,
    bool isCurrentEquipment,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: isCurrentEquipment
              ? primaryColor
              : (isSelected ? primaryColor.withOpacity(0.1) : Colors.white),
          border: Border.all(
            color: isCurrentEquipment || isSelected
                ? primaryColor
                : Colors.grey.shade300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.check_circle,
                  color: isCurrentEquipment ? Colors.white : primaryColor,
                  size: 18,
                ),
              ),
            Text(
              equipmentName,
              style: TextStyle(
                fontSize: ResponsiveHelper.fontSize(context, base: 14),
                fontWeight: FontWeight.w500,
                color: isCurrentEquipment
                    ? Colors.white
                    : (isSelected ? primaryColor : Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Extract current equipment UIDs from report
    final currentEquipmentUids =
        widget.report.equipments
            ?.map((e) => e.equipment?.uid ?? '')
            .where((uid) => uid.isNotEmpty)
            .toList() ??
        [];

    return BlocProvider(
      create: (context) => getIt<DailyReportBloc>()
        ..add(
          DailyReportEvent.loadEquipmentsForEdit(
            companyUID: widget.report.workScope?.companyUID ?? '',
            workScopeUID: widget.report.workScope?.uid ?? '',
            forceRefresh: false,
          ),
        ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ResponsiveHelper.getHeight(context, 0.03)),
                    IconButton(
                      style: IconButton.styleFrom(
                        elevation: 2,
                        shadowColor: Colors.black,
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(10),
                      ),
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      'Edit Equipment/ Vehicle/ Machine',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Update the information below if required.',
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),

              // Equipment Selection
              Expanded(
                child: BlocBuilder<DailyReportBloc, DailyReportState>(
                  builder: (context, state) {
                    if (state is EquipmentsLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (state is EquipmentsFailure) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 48,
                            ),
                            SizedBox(height: 16),
                            Text(
                              state.message,
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      );
                    }

                    if (state is! EquipmentsLoaded) {
                      return Center(child: Text('No equipment data'));
                    }

                    final equipmentsState = state;

                    if (equipmentsState.equipments.isEmpty) {
                      return Center(
                        child: Text(
                          'No equipment available for this work scope',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: [
                                ...equipmentsState.equipments.map((equipment) {
                                  final isSelected = equipmentsState
                                      .selectedEquipmentUids
                                      .contains(equipment.uid);
                                  final isCurrentEquipment =
                                      currentEquipmentUids.contains(
                                        equipment.uid,
                                      );

                                  return _buildEquipmentButton(
                                    equipment.name,
                                    isSelected,
                                    isCurrentEquipment,
                                    () {
                                      context.read<DailyReportBloc>().add(
                                        DailyReportEvent.toggleEquipmentForEdit(
                                          equipmentUid: equipment.uid,
                                        ),
                                      );
                                    },
                                  );
                                }),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Update Button
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: BlocBuilder<DailyReportBloc, DailyReportState>(
                  builder: (context, state) {
                    bool isButtonEnabled = false;

                    if (state is EquipmentsLoaded) {
                      // Button enabled if selection changed from original
                      isButtonEnabled = true;
                    }

                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isButtonEnabled
                            ? () {
                                print('hello');
                                // TODO: Will implement PUT API later
                                final currentState = state as EquipmentsLoaded;
                                print(
                                  'Selected Equipment UIDs: ${currentState.selectedEquipmentUids}',
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          disabledBackgroundColor: Colors.grey.shade300,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Update Equipment',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isButtonEnabled
                                ? Colors.white
                                : Colors.grey.shade600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
