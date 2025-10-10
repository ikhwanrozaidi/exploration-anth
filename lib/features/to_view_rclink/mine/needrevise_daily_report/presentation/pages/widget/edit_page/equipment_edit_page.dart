import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../shared/utils/responsive_helper.dart';
import '../../../../../../shared/utils/theme.dart';
import '../../../../../company/presentation/bloc/company_bloc.dart';
import '../../../../../company/presentation/bloc/company_state.dart';
import '../../../../../daily_report_creation/data/datasources/daily_report_creation_api_service.dart';
import '../../../../../daily_report_creation/domain/entities/scope_of_work/work_equipment.dart';
import '../../../../domain/entities/daily_report_response.dart';
import '../../../../../../core/di/injection.dart';
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
  bool _isLoading = true;
  List<WorkEquipment> _availableEquipments = [];
  List<String> _selectedEquipmentUids = [];
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadEquipments();
  }

  // last minute~~
  Future<void> _loadEquipments() async {
    try {
      final companyBloc = context.read<CompanyBloc>();
      final companyState = companyBloc.state;

      if (companyState is! CompanyLoaded ||
          companyState.selectedCompany == null) {
        setState(() {
          _errorMessage = 'Company not selected';
          _isLoading = false;
        });
        return;
      }

      final companyUID = companyState.selectedCompany!.uid;
      final workScopeUID = widget.report.workScope?.uid;

      if (workScopeUID == null) {
        setState(() {
          _errorMessage = 'Work scope not available';
          _isLoading = false;
        });
        return;
      }

      // Fetch equipment directly from API
      final apiService = getIt<DailyReportCreationApiService>();
      final response = await apiService.getEquipments(
        companyUID: companyUID,
        workScopeUID: workScopeUID,
      );

      if (response.isSuccess && response.data != null) {
        // Extract current equipment UIDs
        final currentEquipmentUids =
            widget.report.equipments?.map((e) => e.uid).toList() ?? [];

        setState(() {
          _availableEquipments = response.data!
              .map((model) => model.workEquipment.toEntity())
              .toList();
          _selectedEquipmentUids = List.from(currentEquipmentUids);
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = response.message;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load equipment: $e';
        _isLoading = false;
      });
    }
  }

  void _toggleEquipment(String equipmentUid) {
    setState(() {
      if (_selectedEquipmentUids.contains(equipmentUid)) {
        _selectedEquipmentUids.remove(equipmentUid);
      } else {
        _selectedEquipmentUids.add(equipmentUid);
      }
    });
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
    final currentEquipmentUids =
        widget.report.equipments?.map((e) => e.uid).toList() ?? [];

    return BlocProvider(
      create: (context) => getIt<DailyReportBloc>(),
      child: BlocListener<DailyReportBloc, DailyReportState>(
        listener: (context, state) {
          if (state is DailyReportUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Equipment updated successfully'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context, true);
          } else if (state is DailyReportUpdateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
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
                      SizedBox(
                        height: ResponsiveHelper.getHeight(context, 0.03),
                      ),
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
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : _errorMessage != null
                      ? Center(
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
                                _errorMessage!,
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        )
                      : _availableEquipments.isEmpty
                      ? Center(
                          child: Text(
                            'No equipment available for this work scope',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  children: [
                                    ..._availableEquipments.map((equipment) {
                                      final isSelected = _selectedEquipmentUids
                                          .contains(equipment.uid);
                                      final isCurrentEquipment =
                                          currentEquipmentUids.contains(
                                            equipment.uid,
                                          );

                                      return _buildEquipmentButton(
                                        equipment.name,
                                        isSelected,
                                        isCurrentEquipment,
                                        () => _toggleEquipment(equipment.uid),
                                      );
                                    }),
                                  ],
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                ),

                BlocBuilder<DailyReportBloc, DailyReportState>(
                  builder: (context, state) {
                    final isUpdating = state is DailyReportUpdating;
                    final isButtonEnabled =
                        !_isLoading && _errorMessage == null && !isUpdating;

                    return Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: isButtonEnabled
                              ? () {
                                  // Get companyUID
                                  final companyBloc = context
                                      .read<CompanyBloc>();
                                  final companyState = companyBloc.state;
                                  String companyUID = '';

                                  if (companyState is CompanyLoaded &&
                                      companyState.selectedCompany != null) {
                                    companyUID =
                                        companyState.selectedCompany!.uid;
                                  }

                                  // Build payload
                                  final equipmentsPayload =
                                      _selectedEquipmentUids
                                          .map(
                                            (uid) => {'workEquipmentUID': uid},
                                          )
                                          .toList();

                                  final updateData = {
                                    "equipments": equipmentsPayload,
                                  };

                                  // Dispatch update event
                                  context.read<DailyReportBloc>().add(
                                    DailyReportEvent.updateDailyReport(
                                      companyUID: companyUID,
                                      dailyReportUID: widget.report.uid,
                                      updateData: updateData,
                                    ),
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            disabledBackgroundColor: Colors.grey[300],
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
                          child: Text(
                            'Update',
                            style: TextStyle(
                              color: !_isLoading && _errorMessage == null
                                  ? Colors.white
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
