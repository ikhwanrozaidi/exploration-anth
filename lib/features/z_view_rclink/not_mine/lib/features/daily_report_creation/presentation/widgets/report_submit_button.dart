import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../bloc/report_creation_bloc.dart';
import '../bloc/report_creation_state.dart';
import '../constant/field_enhancements.dart';
import 'tips_page.dart';

/// Submit button for the report creation form
/// Handles validation and navigation to tips page
class ReportSubmitButton extends StatelessWidget {
  const ReportSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCreationBloc, ReportCreationState>(
      builder: (context, state) {
        // Check if form is complete and valid
        final canProceed = state.maybeWhen(
          selectingBasicInfo: (apiData, selections) =>
              selections.selectedScope != null &&
              selections.selectedWeather != null &&
              selections.selectedRoad != null &&
              selections.section != null &&
              selections.section!.isNotEmpty,
          orElse: () => false,
        );

        final hasError = state.maybeWhen(
          selectingBasicInfo: (apiData, selections) => selections.sectionError != null,
          basicInfoError: (apiData, selections, errorMessage) =>
              selections.sectionError != null,
          orElse: () => false,
        );

        final isButtonEnabled = canProceed && !hasError;

        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isButtonEnabled
                ? () => _navigateToTips(context, state)
                : () => _showValidationError(context, state, hasError),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isButtonEnabled ? primaryColor : Colors.grey.shade400,
              padding: ResponsiveHelper.padding(
                context,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
            ),
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveHelper.fontSize(
                  context,
                  base: 14,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showValidationError(
    BuildContext context,
    ReportCreationState state,
    bool hasError,
  ) {
    List<String> missingFields = [];

    final currentSelections = state.maybeWhen(
      selectingBasicInfo: (apiData, selections) => selections,
      basicInfoError: (apiData, selections, errorMessage) => selections,
      orElse: () => null,
    );

    if (currentSelections != null) {
      if (currentSelections.selectedScope == null) {
        missingFields.add('Scope of Work');
      }
      if (currentSelections.selectedWeather == null) {
        missingFields.add('Weather');
      }
      if (currentSelections.selectedRoad == null) {
        missingFields.add('Location');
      }
      if (currentSelections.section == null || currentSelections.section!.isEmpty) {
        missingFields.add('Section');
      } else if (hasError) {
        missingFields.add('Valid Section');
      }
    }

    if (missingFields.isNotEmpty) {
      CustomSnackBar.show(
        context,
        'Please complete: ${missingFields.join(', ')}',
      );
    }
  }

  void _navigateToTips(BuildContext context, ReportCreationState state) {
    final selections = state.maybeWhen(
      selectingBasicInfo: (apiData, selections) => selections,
      basicInfoError: (apiData, selections, errorMessage) => selections,
      orElse: () => null,
    );

    if (selections == null) return;

    // Check if can proceed
    List<String> missingFields = [];
    if (selections.selectedScope == null) missingFields.add('Scope of Work');
    if (selections.selectedWeather == null) missingFields.add('Weather');
    if (selections.selectedRoad == null) missingFields.add('Location');
    if (selections.section == null || selections.section!.isEmpty) {
      missingFields.add('Section');
    }

    if (missingFields.isNotEmpty) {
      CustomSnackBar.show(
        context,
        'Please complete: ${missingFields.join(', ')}',
      );
      return;
    }

    final bloc = context.read<ReportCreationBloc>();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: bloc,
          child: TipsOnboardingPage(
            scopeOfWork:
                '${selections.selectedScope!.code} - ${selections.selectedScope!.name}',
            weather: WeatherEnhancements.getWeatherData(
                      selections.selectedWeather!,
                    )?.displayName ??
                selections.selectedWeather!,
            location:
                '${selections.selectedRoad?.name ?? ''}, ${selections.selectedDistrict?.name ?? ''}',
            section: selections.section!,
          ),
        ),
      ),
    );
  }
}
