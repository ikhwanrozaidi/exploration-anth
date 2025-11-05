import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_equipment.dart';
import '../../../../../../core/di/injection.dart';
import '../../../../../../shared/utils/responsive_helper.dart';
import '../../../../../../shared/utils/theme.dart';
import '../../../../domain/entities/daily_report.dart';
import '../../../bloc/daily_report_edit/daily_report_edit_bloc.dart';
import '../../../bloc/daily_report_edit/daily_report_edit_event.dart';
import '../../../bloc/daily_report_edit/daily_report_edit_state.dart';

class EquipmentEditPage extends StatefulWidget {
  final DailyReport report;

  const EquipmentEditPage({Key? key, required this.report}) : super(key: key);

  @override
  State<EquipmentEditPage> createState() => _EquipmentEditPageState();
}

class _EquipmentEditPageState extends State<EquipmentEditPage> {
  late Set<String> selectedEquipmentUids;

  @override
  void initState() {
    super.initState();
    // Initialize with equipment UIDs from the report
    selectedEquipmentUids = widget.report.equipments
            ?.map((e) => e.uid)
            .toSet() ??
        {};
  }

  void _toggleEquipment(WorkEquipment equipment) {
    setState(() {
      if (selectedEquipmentUids.contains(equipment.uid)) {
        selectedEquipmentUids.remove(equipment.uid);
      } else {
        selectedEquipmentUids.add(equipment.uid);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
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
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Text(
                'Update the information below if required.',
                style: TextStyle(fontSize: 13),
              ),

              SizedBox(height: 30),

              // Equipment list from BLoC
              Expanded(
                child: BlocBuilder<DailyReportEditBloc, DailyReportEditState>(
                  bloc: getIt<DailyReportEditBloc>(),
                  builder: (context, state) {
                    return state.maybeWhen(
                      editing: (apiData, selections, formData, reportUID, companyUID) {
                        final availableEquipment = apiData.equipment;

                        if (availableEquipment.isEmpty) {
                          return const Center(
                            child: Text('No equipment available for this work scope'),
                          );
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Wrap(
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  children: availableEquipment.map((equipment) {
                                    final isSelected = selectedEquipmentUids.contains(
                                      equipment.uid,
                                    );
                                    return _buildEquipmentButton(
                                      equipment.name,
                                      isSelected,
                                      () => _toggleEquipment(equipment),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),

                            SizedBox(height: ResponsiveHelper.spacing(context, 2)),

                            // Update Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Find selected equipment objects and dispatch toggle events
                                  final bloc = getIt<DailyReportEditBloc>();
                                  final selectedEquipments = availableEquipment
                                      .where((eq) => selectedEquipmentUids.contains(eq.uid))
                                      .toList();

                                  // Clear current selections and add new ones
                                  // First, remove all current equipment
                                  for (final eq in selections.selectedEquipment) {
                                    bloc.add(
                                      DailyReportEditEvent.toggleEquipment(equipment: eq),
                                    );
                                  }

                                  // Then add selected equipment
                                  for (final eq in selectedEquipments) {
                                    bloc.add(
                                      DailyReportEditEvent.toggleEquipment(equipment: eq),
                                    );
                                  }

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Equipment updated!'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  padding: ResponsiveHelper.padding(
                                    context,
                                    vertical: 10,
                                    horizontal: 20,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: ResponsiveHelper.borderRadius(
                                      context,
                                      all: 14,
                                    ),
                                  ),
                                  elevation: ResponsiveHelper.adaptive(
                                    context,
                                    mobile: 1,
                                    tablet: 2,
                                    desktop: 3,
                                  ),
                                ),
                                child: const Text(
                                  'Update',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),

                            SizedBox(height: ResponsiveHelper.spacing(context, 2)),
                          ],
                        );
                      },
                      loadingData: (apiData, selections, formData, reportUID, companyUID) {
                        // Still show equipment list while loading additional data
                        final availableEquipment = apiData.equipment;

                        if (availableEquipment.isEmpty) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Wrap(
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  children: availableEquipment.map((equipment) {
                                    final isSelected = selectedEquipmentUids.contains(
                                      equipment.uid,
                                    );
                                    return _buildEquipmentButton(
                                      equipment.name,
                                      isSelected,
                                      () => _toggleEquipment(equipment),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(height: ResponsiveHelper.spacing(context, 2)),
                          ],
                        );
                      },
                      error: (message, apiData, selections, formData, reportUID, companyUID) {
                        // Show error message but still show equipment list if available
                        final availableEquipment = apiData.equipment;

                        return Column(
                          children: [
                            Container(
                              color: Colors.red.shade50,
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  const Icon(Icons.error, color: Colors.red),
                                  const SizedBox(width: 8),
                                  Expanded(child: Text(message)),
                                ],
                              ),
                            ),
                            if (availableEquipment.isNotEmpty)
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    children: availableEquipment.map((equipment) {
                                      final isSelected = selectedEquipmentUids.contains(
                                        equipment.uid,
                                      );
                                      return _buildEquipmentButton(
                                        equipment.name,
                                        isSelected,
                                        () => _toggleEquipment(equipment),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )
                            else
                              const Expanded(
                                child: Center(
                                  child: Text('No equipment available'),
                                ),
                              ),
                          ],
                        );
                      },
                      orElse: () => const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text('Loading equipment...'),
                          ],
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

  Widget _buildEquipmentButton(
    String name,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (isSelected) ...[
              SizedBox(width: 8),
              Icon(Icons.check, size: 16, color: Colors.white),
            ],
          ],
        ),
      ),
    );
  }
}
