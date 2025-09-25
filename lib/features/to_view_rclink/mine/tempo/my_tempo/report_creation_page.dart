import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../../shared/widgets/custom_snackbar.dart';
import '../../bloc/report_creation_bloc.dart';
import '../../bloc/report_creation_event.dart';
import '../../bloc/report_creation_state.dart';
import '../../constant/field_enhancements.dart';
import '../widgets/tips_page.dart';

class DailyReportCreationPage extends StatefulWidget {
  const DailyReportCreationPage({Key? key}) : super(key: key);

  @override
  State<DailyReportCreationPage> createState() =>
      _DailyReportCreationPageState();
}

class _DailyReportCreationPageState extends State<DailyReportCreationPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _sectionController = TextEditingController();
  late ReportCreationBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<ReportCreationBloc>();

    // Load initial data
    _bloc.add(const LoadWorkScopesRequested());
    _bloc.add(const LoadStatesRequested());
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _sectionController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultPrimaryColor =
        primaryColor ?? Theme.of(context).primaryColor;

    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: defaultPrimaryColor,
        body: BlocListener<ReportCreationBloc, ReportCreationState>(
          listener: (context, state) {
            // Show errors
            if (state.hasErrors) {
              for (final error in state.allErrors) {
                CustomSnackBar.show(context, error);
              }
            }

            // Update section controller when section changes externally
            if (state.section != _sectionController.text) {
              _sectionController.text = state.section ?? '';
            }
          },
          child: BlocBuilder<ReportCreationBloc, ReportCreationState>(
            builder: (context, state) {
              return SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    // Header section
                    Container(
                      padding: ResponsiveHelper.padding(
                        context,
                        horizontal: 25,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Container(
                                  padding: ResponsiveHelper.padding(
                                    context,
                                    all: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'Add Daily Report',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                          SizedBox(
                            height: ResponsiveHelper.spacing(context, 30),
                          ),
                        ],
                      ),
                    ),

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
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: ResponsiveHelper.spacing(
                                        context,
                                        10,
                                      ),
                                    ),

                                    // Scope of work
                                    _buildScopeOfWorkField(context, state),
                                    SizedBox(
                                      height: ResponsiveHelper.spacing(
                                        context,
                                        20,
                                      ),
                                    ),

                                    // Weather
                                    _buildWeatherField(context, state),
                                    SizedBox(
                                      height: ResponsiveHelper.spacing(
                                        context,
                                        20,
                                      ),
                                    ),

                                    // Location (State)
                                    _buildLocationField(context, state),
                                    SizedBox(
                                      height: ResponsiveHelper.spacing(
                                        context,
                                        20,
                                      ),
                                    ),

                                    // Section
                                    _buildSectionField(context, state),
                                    SizedBox(
                                      height: ResponsiveHelper.spacing(
                                        context,
                                        40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Add button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: state.canProceedToTips
                                    ? () => _navigateToTips(context, state)
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  padding: ResponsiveHelper.padding(
                                    context,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 2,
                                ),
                                child: state.isLoading
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
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
                            ),
                            SizedBox(
                              height: ResponsiveHelper.spacing(context, 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildScopeOfWorkField(
    BuildContext context,
    ReportCreationState state,
  ) {
    final selectedScope = state.selectedScope;

    return GestureDetector(
      onTap: () => _showScopeSelection(context, state),
      child: Container(
        padding: ResponsiveHelper.padding(context, all: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.work_outline,
              color: Colors.grey.shade600,
              size: ResponsiveHelper.fontSize(context, base: 20),
            ),
            SizedBox(width: ResponsiveHelper.spacing(context, 12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scope of Work',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 12),
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.spacing(context, 4)),
                  Text(
                    selectedScope?.name ?? 'Select scope of work',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      color: selectedScope != null
                          ? Colors.black87
                          : Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade600,
              size: ResponsiveHelper.fontSize(context, base: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherField(BuildContext context, ReportCreationState state) {
    final selectedWeatherData = state.selectedWeather != null
        ? WeatherEnhancements.getWeatherData(state.selectedWeather!)
        : null;

    return GestureDetector(
      onTap: () => _showWeatherSelection(context, state),
      child: Container(
        padding: ResponsiveHelper.padding(context, all: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              selectedWeatherData?.icon ?? Icons.wb_sunny,
              color: Colors.grey.shade600,
              size: ResponsiveHelper.fontSize(context, base: 20),
            ),
            SizedBox(width: ResponsiveHelper.spacing(context, 12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weather',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 12),
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.spacing(context, 4)),
                  Text(
                    selectedWeatherData?.displayName ??
                        'Select weather condition',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      color: selectedWeatherData != null
                          ? Colors.black87
                          : Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade600,
              size: ResponsiveHelper.fontSize(context, base: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationField(BuildContext context, ReportCreationState state) {
    String locationText = 'Select location';

    if (state.selectedRoad != null) {
      locationText =
          '${state.selectedState?.name ?? ''} > ${state.selectedDistrict?.name ?? ''} > ${state.selectedRoad?.name ?? ''}';
    } else if (state.selectedDistrict != null) {
      locationText =
          '${state.selectedState?.name ?? ''} > ${state.selectedDistrict?.name ?? ''}';
    } else if (state.selectedState != null) {
      locationText = state.selectedState!.name ?? 'Unknown State';
    }

    return GestureDetector(
      onTap: () => _showLocationSelection(context, state),
      child: Container(
        padding: ResponsiveHelper.padding(context, all: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.grey.shade600,
              size: ResponsiveHelper.fontSize(context, base: 20),
            ),
            SizedBox(width: ResponsiveHelper.spacing(context, 12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 12),
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.spacing(context, 4)),
                  Text(
                    locationText,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      color: state.selectedRoad != null
                          ? Colors.black87
                          : Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (state.isLoadingStates ||
                state.isLoadingDistricts ||
                state.isLoadingRoads)
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.grey.shade600,
                ),
              )
            else
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey.shade600,
                size: ResponsiveHelper.fontSize(context, base: 20),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionField(BuildContext context, ReportCreationState state) {
    final hasError = state.hasFieldError('section');
    final errorMessage = state.getFieldError('section');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: ResponsiveHelper.padding(context, all: 16),
          decoration: BoxDecoration(
            border: Border.all(
              color: hasError ? Colors.red.shade300 : Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                Icons.straighten,
                color: hasError ? Colors.red.shade600 : Colors.grey.shade600,
                size: ResponsiveHelper.fontSize(context, base: 20),
              ),
              SizedBox(width: ResponsiveHelper.spacing(context, 12)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Section',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 12),
                        color: hasError
                            ? Colors.red.shade600
                            : Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: ResponsiveHelper.spacing(context, 4)),
                    TextFormField(
                      controller: _sectionController,
                      focusNode: _focusNode,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: state.selectedRoad != null
                            ? 'Enter section (${state.selectedRoad!.sectionStart ?? '0'} - ${state.selectedRoad!.sectionFinish ?? '0'})'
                            : 'Enter section',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) {
                        context.read<ReportCreationBloc>().add(
                          SectionUpdated(value),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (hasError && errorMessage != null)
          Padding(
            padding: ResponsiveHelper.padding(context, top: 8, left: 12),
            child: Text(
              errorMessage,
              style: TextStyle(
                fontSize: ResponsiveHelper.fontSize(context, base: 12),
                color: Colors.red.shade600,
              ),
            ),
          ),
      ],
    );
  }

  // ============================================================================
  // SELECTION METHODS
  // ============================================================================

  void _showScopeSelection(BuildContext context, ReportCreationState state) {
    if (state.workScopes == null || state.workScopes!.isEmpty) {
      if (state.isLoadingWorkScopes) {
        CustomSnackBar.show(context, 'Loading work scopes...');
      } else {
        CustomSnackBar.show(context, 'No work scopes available');
      }
      return;
    }

    showFlexibleBottomsheet(
      context: context,
      title: 'Select Scope of Work',
      attributes: state.workScopes!
          .where((scope) => scope.name.isNotEmpty)
          .map((scope) => scope.name)
          .toList(),
      isRadio: true,
      onSelectionChanged: (selectedName) {
        final selectedScope = state.workScopes!.firstWhere(
          (scope) => scope.name == selectedName,
        );
        context.read<ReportCreationBloc>().add(
          ScopeOfWorkSelected(selectedScope.uid),
        );
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
        // Find the enum key for the selected display name
        final weatherData = WeatherEnhancements.weatherData.entries.firstWhere(
          (entry) => entry.value.displayName == selectedDisplayName,
        );
        context.read<ReportCreationBloc>().add(
          WeatherSelected(weatherData.key),
        );
      },
    );
  }

  void _showLocationSelection(BuildContext context, ReportCreationState state) {
    if (state.states == null || state.states!.isEmpty) {
      CustomSnackBar.show(context, 'No states available');
      return;
    }

    // Show state selection first
    showFlexibleBottomsheet(
      context: context,
      title: 'Select State',
      attributes: state.states!
          .map((state) => state.name)
          .whereType<String>()
          .toList(),
      isRadio: true,
      onSelectionChanged: (selectedName) {
        final selectedState = state.states!.firstWhere(
          (state) => state.name == selectedName,
        );
        context.read<ReportCreationBloc>().add(
          StateSelected(selectedState.uid!),
        );

        // Show district selection after state is selected
        Future.delayed(const Duration(milliseconds: 500), () {
          _showDistrictSelection(context);
        });
      },
    );
  }

  void _showDistrictSelection(BuildContext context) {
    final state = context.read<ReportCreationBloc>().state;

    if (state.districts == null || state.districts!.isEmpty) {
      if (state.isLoadingDistricts) {
        CustomSnackBar.show(context, 'Loading districts...');
      } else {
        CustomSnackBar.show(
          context,
          'No districts available for selected state',
        );
      }
      return;
    }

    showFlexibleBottomsheet(
      context: context,
      title: 'Select District',
      attributes: state.districts!
          .where(
            (district) => district.name != null && district.name!.isNotEmpty,
          )
          .map((district) => district.name!)
          .toList(),
      isRadio: true,
      onSelectionChanged: (selectedName) {
        final selectedDistrict = state.districts!.firstWhere(
          (district) => district.name == selectedName,
        );
        if (selectedDistrict.uid != null) {
          context.read<ReportCreationBloc>().add(
            DistrictSelected(selectedDistrict.uid!),
          );

          // Show road selection after district is selected
          Future.delayed(const Duration(milliseconds: 500), () {
            _showRoadSelection(context);
          });
        } else {
          CustomSnackBar.show(context, 'Invalid district selection');
        }
      },
    );
  }

  void _showRoadSelection(BuildContext context) {
    final state = context.read<ReportCreationBloc>().state;

    if (state.roads == null || state.roads!.isEmpty) {
      if (state.isLoadingRoads) {
        CustomSnackBar.show(context, 'Loading roads...');
      } else {
        CustomSnackBar.show(
          context,
          'No roads available for selected district',
        );
      }
      return;
    }

    showFlexibleBottomsheet(
      context: context,
      title: 'Select Road',
      attributes: state.roads!
          .where((road) => road.name != null && road.name!.isNotEmpty)
          .map((road) => '${road.name!} (${road.roadNo ?? ''})')
          .toList(),
      isRadio: true,
      onSelectionChanged: (selectedName) {
        final selectedRoad = state.roads!.firstWhere(
          (road) => '${road.name!} (${road.roadNo ?? ''})' == selectedName,
        );
        if (selectedRoad.uid != null) {
          context.read<ReportCreationBloc>().add(
            RoadSelected(selectedRoad.uid!),
          );
        } else {
          CustomSnackBar.show(context, 'Invalid road selection');
        }
      },
    );
  }

  void _navigateToTips(BuildContext context, ReportCreationState state) {
    if (!state.canProceedToTips) {
      List<String> missingFields = [];

      if (state.selectedScopeUid == null) missingFields.add('Scope of Work');
      if (state.selectedWeather == null) missingFields.add('Weather');
      if (state.selectedRoadUid == null) missingFields.add('Location');
      if (state.section == null || state.section!.isEmpty)
        missingFields.add('Section');

      CustomSnackBar.show(
        context,
        'Please complete: ${missingFields.join(', ')}',
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: _bloc,
          child: TipsOnboardingPage(
            scopeOfWork: state.selectedScope!.name,
            weather:
                WeatherEnhancements.getWeatherData(
                  state.selectedWeather!,
                )?.displayName ??
                state.selectedWeather!,
            location:
                '${state.selectedState?.name ?? ''} > ${state.selectedDistrict?.name ?? ''} > ${state.selectedRoad?.name ?? ''}',
            section: state.section!,
          ),
        ),
      ),
    );
  }
}
