import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../bloc/report_creation_bloc.dart';
import '../bloc/report_creation_event.dart';
import '../bloc/report_creation_state.dart';
import '../widgets/report_creation_header.dart';
import '../widgets/report_creation_form.dart';
import '../widgets/report_submit_button.dart';

class DailyReportCreationPage extends StatefulWidget {
  const DailyReportCreationPage({super.key});

  @override
  State<DailyReportCreationPage> createState() =>
      _DailyReportCreationPageState();
}

class _DailyReportCreationPageState extends State<DailyReportCreationPage> {
  late ReportCreationBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<ReportCreationBloc>();

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

      Future.delayed(const Duration(milliseconds: 100), () {
        _bloc.add(const LoadStates());
      });
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
