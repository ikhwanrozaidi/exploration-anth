import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/location_service_check_dialog.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../widgets/warning_creation_form.dart';
import 'warning_draft_page.dart';

class WarningCreationPage extends StatefulWidget {
  final String? draftUID;
  final bool isNewDraft;

  const WarningCreationPage({
    super.key,
    this.draftUID,
    this.isNewDraft = false,
  });

  @override
  State<WarningCreationPage> createState() => _WarningCreationPageState();
}

class _WarningCreationPageState extends State<WarningCreationPage> {
  bool _isFormValid = false;

  String? _scopeID;
  String? _scopeUID;
  String? _scopeName;
  Road? _road;
  bool _isRangeMode = false;
  String? _sectionSingle;
  String? _sectionStart;
  String? _sectionEnd;

  bool _isLocationServiceChecked = false;
  bool _isCheckingLocation = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Check location service when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLocationService();
    });
  }

  Future<void> _checkLocationService() async {
    setState(() {
      _isCheckingLocation = true;
    });

    try {
      // First check if location service is actually enabled
      bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

      if (isServiceEnabled) {
        // Location is already enabled, allow access
        if (mounted) {
          setState(() {
            _isLocationServiceChecked = true;
            _isCheckingLocation = false;
          });
        }
        return;
      }

      // Location is disabled, show dialog
      final userWantsToEnable = await LocationServiceCheckDialog.check(context);

      if (!userWantsToEnable || !mounted) {
        // User cancelled, don't check again automatically
        setState(() {
          _isCheckingLocation = false;
        });
        return;
      }

      // User tapped Continue and went to settings
      // Wait a moment for settings to open, then check again when they return
      // We'll wait for app to resume and check again
      await Future.delayed(const Duration(milliseconds: 500));

      // Check if location was actually enabled
      isServiceEnabled = await Geolocator.isLocationServiceEnabled();

      if (mounted) {
        setState(() {
          _isLocationServiceChecked = isServiceEnabled;
          _isCheckingLocation = false;
        });

        if (!isServiceEnabled) {
          CustomSnackBar.show(
            context,
            'Location service is still disabled. Please enable it to continue.',
          );
        }
      }
    } catch (e) {
      print('❌ Error checking location service: $e');
      if (mounted) {
        setState(() {
          _isCheckingLocation = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Material(
        child: Container(
          decoration: BoxDecoration(
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

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // if (_currentPage > 0) {
                          //   _goToPreviousPage();
                          // } else {
                          //   Navigator.pop(context);
                          // }

                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(-2, 6),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.black,
                            size: ResponsiveHelper.iconSize(context, base: 20),
                          ),
                        ),
                      ),

                      SizedBox(width: ResponsiveHelper.spacing(context, 15)),

                      Text(
                        'Site Warning',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: ResponsiveHelper.spacing(context, 25)),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
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
                      children: [
                        SizedBox(height: ResponsiveHelper.spacing(context, 10)),

                        Expanded(
                          child: _isLocationServiceChecked
                              ? WarningCreationForm(
                                  onValidationChanged: (isValid) {
                                    setState(() {
                                      _isFormValid = isValid;
                                    });
                                  },
                                  onDataChanged: (data) {
                                    setState(() {
                                      _scopeID = data['scopeID'] as String?;
                                      _scopeUID = data['scopeUID'] as String?;
                                      _scopeName = data['scopeName'] as String?;
                                      _road = data['road'] as Road?;
                                      _isRangeMode =
                                          data['isRangeMode'] as bool? ?? false;
                                      _sectionSingle =
                                          data['sectionSingle'] as String?;
                                      _sectionStart =
                                          data['sectionStart'] as String?;
                                      _sectionEnd =
                                          data['sectionEnd'] as String?;
                                    });
                                  },
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.95),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (_isCheckingLocation) ...[
                                          CircularProgressIndicator(
                                            color: primaryColor,
                                          ),
                                          SizedBox(
                                            height: ResponsiveHelper.spacing(
                                              context,
                                              16,
                                            ),
                                          ),
                                          Text(
                                            'Checking location service...',
                                            style: TextStyle(
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
                                                    context,
                                                    base: 14,
                                                  ),
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                        ] else ...[
                                          Icon(
                                            Icons.location_off,
                                            size:
                                                ResponsiveHelper.adaptive<
                                                  double
                                                >(
                                                  context,
                                                  mobile: 64,
                                                  tablet: 72,
                                                  desktop: 80,
                                                ),
                                            color: Colors.grey.shade400,
                                          ),
                                          SizedBox(
                                            height: ResponsiveHelper.spacing(
                                              context,
                                              16,
                                            ),
                                          ),
                                          Padding(
                                            padding: ResponsiveHelper.padding(
                                              context,
                                              horizontal: 40,
                                            ),
                                            child: Text(
                                              'Location service is required',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 16,
                                                    ),
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: ResponsiveHelper.spacing(
                                              context,
                                              8,
                                            ),
                                          ),
                                          Padding(
                                            padding: ResponsiveHelper.padding(
                                              context,
                                              horizontal: 40,
                                            ),
                                            child: Text(
                                              'Please enable location services to create warnings',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 14,
                                                    ),
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: ResponsiveHelper.spacing(
                                              context,
                                              24,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: _checkLocationService,
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: primaryColor,
                                              foregroundColor: Colors.white,
                                              padding: ResponsiveHelper.padding(
                                                context,
                                                horizontal: 32,
                                                vertical: 14,
                                              ),
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    ResponsiveHelper.borderRadius(
                                                      context,
                                                      all: 12,
                                                    ),
                                              ),
                                            ),
                                            child: Text(
                                              'Enable Location',
                                              style: TextStyle(
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 15,
                                                    ),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                        ),

                        _isLocationServiceChecked
                            ? SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _isFormValid
                                      ? () {
                                          if (_scopeID == null ||
                                              _scopeID!.isEmpty ||
                                              _scopeName == null ||
                                              _scopeName!.isEmpty ||
                                              _road == null) {
                                            return;
                                          }

                                          final String startSection =
                                              _isRangeMode
                                              ? (_sectionStart ?? '')
                                              : (_sectionSingle ?? '');

                                          final String? endSection =
                                              _isRangeMode ? _sectionEnd : null;

                                          if (startSection.isEmpty) {
                                            return;
                                          }

                                          if (_isRangeMode &&
                                              (endSection == null ||
                                                  endSection.isEmpty)) {
                                            return;
                                          }

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  WarningDraftPage(
                                                    scopeID: int.parse(
                                                      _scopeID!,
                                                    ),
                                                    scopeUID: _scopeUID,
                                                    scopeName: _scopeName!,
                                                    road: _road!,
                                                    startSection: startSection,
                                                    endSection: endSection,
                                                  ),
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
                                      borderRadius:
                                          ResponsiveHelper.borderRadius(
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
                                    'Next',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),

                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
