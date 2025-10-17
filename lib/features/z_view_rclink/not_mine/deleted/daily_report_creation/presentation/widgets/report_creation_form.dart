import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../bloc/report_creation_bloc.dart';
import '../bloc/report_creation_event.dart';
import '../bloc/report_creation_state.dart';
import '../constant/field_enhancements.dart';
import 'location_selection_flow.dart';
import 'selection_field_card.dart';

/// Form container with all selection fields
class ReportCreationForm extends StatefulWidget {
  const ReportCreationForm({Key? key}) : super(key: key);

  @override
  State<ReportCreationForm> createState() => _ReportCreationFormState();
}

class _ReportCreationFormState extends State<ReportCreationForm> {
  final TextEditingController _sectionController = TextEditingController();

  // Local display values
  String selectedScopeDisplay = '';
  String selectedWeatherDisplay = '';
  String selectedLocationDisplay = '';

  @override
  void dispose() {
    _sectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportCreationBloc, ReportCreationState>(
      listener: (context, state) {
        // Handle errors
        state.maybeWhen(
          basicInfoError: (apiData, selections, errorMessage) {
            CustomSnackBar.show(context, errorMessage);
          },
          orElse: () {},
        );

        // Update section controller
        final currentSection = state.maybeWhen(
          selectingBasicInfo: (apiData, selections) => selections.section,
          basicInfoError: (apiData, selections, errorMessage) =>
              selections.section,
          orElse: () => null,
        );

        if (currentSection != _sectionController.text) {
          _sectionController.text = currentSection ?? '';
        }
      },
      child: BlocBuilder<ReportCreationBloc, ReportCreationState>(
        builder: (context, state) {
          // Get current selections from BLoC state
          final selections = state.maybeWhen(
            selectingBasicInfo: (apiData, selections) => selections,
            basicInfoError: (apiData, selections, errorMessage) => selections,
            orElse: () => null,
          );

          // Update display values from BLoC state
          if (selections?.selectedScope != null) {
            selectedScopeDisplay =
                '${selections!.selectedScope!.code} - ${selections.selectedScope!.name}';
          }
          if (selections?.selectedWeather != null) {
            selectedWeatherDisplay = WeatherEnhancements.getWeatherData(
                      selections!.selectedWeather!,
                    )?.displayName ??
                selections.selectedWeather!;
          }
          if (selections?.selectedRoad != null) {
            selectedLocationDisplay =
                '${selections!.selectedRoad!.name!} (${selections.selectedRoad!.roadNo ?? ''})';
          }

          final sectionError = selections?.sectionError;
          final hasError = sectionError != null;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ResponsiveHelper.spacing(context, 10)),

                // Scope of Work
                SelectionFieldCard(
                  icon: Icons.restaurant_menu,
                  label: 'Scope of Work',
                  value: selectedScopeDisplay,
                  placeholder: 'Choose scope of work',
                  onTap: () => _showScopeSelection(context, state),
                ),

                SizedBox(height: ResponsiveHelper.spacing(context, 10)),

                // Weather
                SelectionFieldCard(
                  icon: Icons.sunny,
                  label: 'Weather',
                  value: selectedWeatherDisplay,
                  placeholder: 'Choose current weather',
                  onTap: () => _showWeatherSelection(context, state),
                ),

                SizedBox(height: ResponsiveHelper.spacing(context, 10)),

                // Location
                SelectionFieldCard(
                  icon: Icons.location_on,
                  label: 'Location',
                  value: selectedLocationDisplay,
                  placeholder: 'Choose location',
                  onTap: () => _showLocationSelection(context, state),
                ),

                // Section
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: hasError ? Colors.red : Colors.grey.shade400,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: hasError
                                    ? Colors.red.shade50
                                    : const Color.fromARGB(255, 214, 226, 255),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.swap_calls,
                                  color: hasError ? Colors.red : const Color(0xFF5B7FFF),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Section',
                                    style: TextStyle(
                                      color: hasError
                                          ? Colors.red.shade600
                                          : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextField(
                                    controller: _sectionController,
                                    onChanged: (value) {
                                      context
                                          .read<ReportCreationBloc>()
                                          .add(UpdateSection(value));
                                    },
                                    keyboardType: const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Type section",
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                          color: hasError
                                              ? Colors.red
                                              : const Color(0xFF5B7FFF),
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Builder(
                                    builder: (context) {
                                      final selectedRoad = selections?.selectedRoad;

                                      if (selectedRoad?.sectionStart != null &&
                                          selectedRoad?.sectionFinish != null) {
                                        return Text(
                                          'Range from ${selectedRoad!.sectionStart} - ${selectedRoad.sectionFinish}',
                                          style: TextStyle(
                                            fontWeight: hasError
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 10,
                                            ),
                                            color: hasError
                                                ? Colors.red
                                                : Colors.black,
                                          ),
                                        );
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: ResponsiveHelper.spacing(context, 40)),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showScopeSelection(BuildContext context, ReportCreationState state) {
    final workScopes = state.maybeWhen(
      selectingBasicInfo: (apiData, selections) => apiData.workScopes,
      basicInfoError: (apiData, selections, errorMessage) => apiData.workScopes,
      orElse: () => null,
    );

    if (workScopes == null || workScopes.isEmpty) {
      CustomSnackBar.show(context, 'No work scopes available');
      return;
    }

    showFlexibleBottomsheet(
      context: context,
      title: 'Select Scope of Work',
      attributes: workScopes
          .where((scope) => scope.name.isNotEmpty)
          .map((scope) => '${scope.code} - ${scope.name}')
          .toList(),
      isRadio: true,
      onSelectionChanged: (selectedName) {
        final selectedScope = workScopes.firstWhere(
          (scope) => '${scope.code} - ${scope.name}' == selectedName,
        );
        context.read<ReportCreationBloc>().add(SelectScope(selectedScope.uid));

        setState(() {
          selectedScopeDisplay = selectedName;
        });
      },
    );
  }

  void _showWeatherSelection(BuildContext context, ReportCreationState state) {
    final weatherOptions = WeatherEnhancements.getAllWeatherDisplayNames();

    showFlexibleBottomsheet(
      context: context,
      title: 'Select Weather Condition',
      attributes: weatherOptions,
      isRadio: true,
      onSelectionChanged: (selectedDisplayName) {
        final weatherData = WeatherEnhancements.weatherData.entries.firstWhere(
          (entry) => entry.value.displayName == selectedDisplayName,
        );
        context.read<ReportCreationBloc>().add(SelectWeather(weatherData.key));

        setState(() {
          selectedWeatherDisplay = selectedDisplayName;
        });
      },
    );
  }

  void _showLocationSelection(BuildContext context, ReportCreationState state) {
    LocationSelectionFlow.showStateSelection(
      context,
      state,
      (selectedLocation) {
        setState(() {
          selectedLocationDisplay = selectedLocation;
        });
      },
    );
  }
}
