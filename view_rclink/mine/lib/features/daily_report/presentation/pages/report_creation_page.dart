import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../bloc/daily_report_create/daily_report_create_bloc.dart';
import '../bloc/daily_report_create/daily_report_create_event.dart';
import '../bloc/daily_report_create/daily_report_create_state.dart';
import '../widgets/report_creation/report_creation_header.dart';
import '../widgets/report_creation/report_creation_form.dart';
import '../widgets/report_creation/report_submit_button.dart';

class DailyReportCreationPage extends StatefulWidget {
  final String? draftUID; // Optional draft UID for editing drafts
  final bool isNewDraft; // If true, will auto-initialize a draft

  const DailyReportCreationPage({
    super.key,
    this.draftUID,
    this.isNewDraft = false,
  });

  @override
  State<DailyReportCreationPage> createState() =>
      _DailyReportCreationPageState();
}

class _DailyReportCreationPageState extends State<DailyReportCreationPage> {
  late DailyReportCreateBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<DailyReportCreateBloc>();

    // CRITICAL: Reset BLoC state when creating new draft
    // This clears any old draftReportUID from previous draft creation
    // (BLoC is @lazySingleton, so it retains state across navigations)
    if (widget.isNewDraft) {
      _bloc.add(const DailyReportCreateEvent.startOver());
    }

    // Handle draft loading/creation
    if (widget.draftUID != null) {
      // Load existing draft
      _bloc.add(LoadExistingDraft(draftUID: widget.draftUID!));
    }
    // Don't initialize draft on page load - let auto-save handle it
    // when user clicks Add button

    // Check if work scopes are already loaded
    final currentState = _bloc.state;
    final hasWorkScopes = currentState.maybeWhen(
      selectingBasicInfo: (apiData, selections) =>
          apiData.workScopes.isNotEmpty,
      basicInfoError: (apiData, selections, errorMessage) =>
          apiData.workScopes.isNotEmpty,
      orElse: () => false,
    );

    if (!hasWorkScopes) {
      _bloc.add(const LoadWorkScopes());

      // LoadStates, LoadDistricts, LoadRoads are handled by RoadFieldTile widget
      // No need to call them here
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 135, 167, 247), primaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.2],
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(height: ResponsiveHelper.getHeight(context, 0.02)),

                  // Header
                  const ReportCreationHeader(),

                  // Form section
                  Expanded(
                    child: Container(
                      padding: ResponsiveHelper.padding(
                        context,
                        horizontal: 25,
                        vertical: 20,
                      ),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Form fields
                          const Expanded(child: ReportCreationForm()),

                          // Submit button
                          const ReportSubmitButton(),

                          SizedBox(
                            height: ResponsiveHelper.spacing(context, 40),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
