import 'package:flutter/material.dart';
import 'package:rclink_app/shared/utils/theme.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/widgets/custom_tab_widget.dart';
import '../../../road/presentation/helper/road_level.dart';
import '../../../road/presentation/helper/road_selection_result.dart';
import '../../../road/presentation/pages/road_field_tile.dart';
import '../../../work_scope/presentation/pages/work_scope_field_tile.dart';

/// Form container with all selection fields
class WarningCreationForm extends StatefulWidget {
  const WarningCreationForm({Key? key}) : super(key: key);

  @override
  State<WarningCreationForm> createState() => _WarningCreationFormState();
}

class _WarningCreationFormState extends State<WarningCreationForm> {
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _sectionStartController = TextEditingController();
  final TextEditingController _sectionEndController = TextEditingController();

  bool _isRangeMode = false;
  bool _hasError = false;
  String? _errorMessage;

  // Store the road section range
  double? _roadSectionStart;
  double? _roadSectionFinish;

  String selectedScopeDisplay = '';
  String selectedWeatherDisplay = '';
  String selectedLocationDisplay = '';

  @override
  void dispose() {
    _sectionController.dispose();
    _sectionStartController.dispose();
    _sectionEndController.dispose();
    super.dispose();
  }

  void _toggleSectionMode() {
    FocusScope.of(context).unfocus();

    setState(() {
      _isRangeMode = !_isRangeMode;
      _hasError = false;
      _errorMessage = null;

      if (_isRangeMode) {
        _sectionController.clear();
      } else {
        _sectionStartController.clear();
        _sectionEndController.clear();
      }
    });
  }

  void _validateSingleSection(String value) {
    if (value.isEmpty) {
      setState(() {
        _hasError = false;
        _errorMessage = null;
      });
      return;
    }

    final double? section = double.tryParse(value);

    if (section == null) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Invalid number';
      });
      return;
    }

    if (_roadSectionStart == null || _roadSectionFinish == null) {
      setState(() {
        _hasError = false;
        _errorMessage = null;
      });
      return;
    }

    if (section < _roadSectionStart! || section > _roadSectionFinish!) {
      setState(() {
        _hasError = true;
        _errorMessage =
            'Section must be between $_roadSectionStart and $_roadSectionFinish';
      });
    } else {
      setState(() {
        _hasError = false;
        _errorMessage = null;
      });
    }
  }

  void _validateRangeSection() {
    final String startValue = _sectionStartController.text;
    final String endValue = _sectionEndController.text;

    if (startValue.isEmpty && endValue.isEmpty) {
      setState(() {
        _hasError = false;
        _errorMessage = null;
      });
      return;
    }

    final double? startSection = double.tryParse(startValue);
    final double? endSection = double.tryParse(endValue);

    // Check for invalid numbers
    if ((startValue.isNotEmpty && startSection == null) ||
        (endValue.isNotEmpty && endSection == null)) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Invalid number';
      });
      return;
    }

    if (_roadSectionStart == null || _roadSectionFinish == null) {
      setState(() {
        _hasError = false;
        _errorMessage = null;
      });
      return;
    }

    if (startSection != null &&
        (startSection < _roadSectionStart! ||
            startSection > _roadSectionFinish!)) {
      setState(() {
        _hasError = true;
        _errorMessage =
            'Start section must be between $_roadSectionStart and $_roadSectionFinish';
      });
      return;
    }

    // Validate end section
    if (endSection != null &&
        (endSection < _roadSectionStart! || endSection > _roadSectionFinish!)) {
      setState(() {
        _hasError = true;
        _errorMessage =
            'End section must be between $_roadSectionStart and $_roadSectionFinish';
      });
      return;
    }

    // Validate that start is less than or equal to end
    if (startSection != null &&
        endSection != null &&
        startSection > endSection) {
      setState(() {
        _hasError = true;
        _errorMessage =
            'Start section must be less than or equal to end section';
      });
      return;
    }

    setState(() {
      _hasError = false;
      _errorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Scope of Work
        WorkScopeFieldTile(
          onScopeSelected: (selectedData) {
            print(
              'Allow Multiple Quantities: ${selectedData['allowMultipleQuantities']}',
            );

            setState(() {
              selectedScopeDisplay = selectedData['displayText'];
            });
          },
        ),

        // Roads
        RoadFieldTile(
          startFrom: RoadLevel.provinces,
          endAt: RoadLevel.roads,
          onRoadSelected: (RoadSelectionResult result) {
            print('sectionStart:: ${result.selectedRoad?.sectionStart}');
            print('sectionFinish:: ${result.selectedRoad?.sectionFinish}');

            setState(() {
              selectedLocationDisplay = result.selectedRoad?.roadNo != null
                  ? '${result.selectedRoad!.name!} (${result.selectedRoad!.roadNo!})'
                  : result.selectedRoad!.name!;

              // Store the road section range
              _roadSectionStart = result.selectedRoad?.sectionStart;
              _roadSectionFinish = result.selectedRoad?.sectionFinish;

              // Reset error state and clear section inputs when road changes
              _hasError = false;
              _errorMessage = null;
              _sectionController.clear();
              _sectionStartController.clear();
              _sectionEndController.clear();
            });
          },
        ),

        // Sections
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: _hasError ? Colors.red : Colors.grey.shade400,
              width: _hasError ? 1.5 : 0.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        // Icon
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: _hasError
                                ? Colors.red.shade50
                                : const Color.fromARGB(255, 214, 226, 255),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.swap_calls,
                              color: _hasError ? Colors.red : primaryColor,
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),

                        // Textfield
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    _isRangeMode ? 'Range Section' : 'Section',
                                    style: TextStyle(
                                      color: _hasError
                                          ? Colors.red
                                          : Colors.black,
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 13,
                                      ),
                                      fontWeight: _hasError
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),

                                  TextButton(
                                    onPressed: _toggleSectionMode,
                                    style: TextButton.styleFrom(
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      backgroundColor: primaryColor,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 2,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Text(
                                      _isRangeMode
                                          ? 'Single Section'
                                          : 'Range Section',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ResponsiveHelper.fontSize(
                                          context,
                                          base: 11,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              // Conditional rendering based on mode
                              _isRangeMode
                                  ? _buildRangeSectionInputs()
                                  : _buildSingleSectionInput(),

                              // // Error message
                              // if (_errorMessage != null) ...[
                              //   const SizedBox(height: 5),
                              //   Text(
                              //     _errorMessage!,
                              //     style: TextStyle(
                              //       color: Colors.red,
                              //       fontSize: ResponsiveHelper.fontSize(
                              //         context,
                              //         base: 11,
                              //       ),
                              //     ),
                              //   ),
                              // ],
                              if (_roadSectionStart != null &&
                                  _roadSectionFinish != null) ...[
                                const SizedBox(height: 5),
                                Text(
                                  _errorMessage != null
                                      ? _errorMessage!
                                      : 'Valid range: $_roadSectionStart - $_roadSectionFinish',
                                  style: TextStyle(
                                    color: _errorMessage != null
                                        ? Colors.red
                                        : Colors.grey.shade600,
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSingleSectionInput() {
    return TextField(
      controller: _sectionController,
      onChanged: (value) {
        _validateSingleSection(value);
        print('Single section: $value');
      },
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        isDense: true,
        hintText: "Type section",
        hintStyle: TextStyle(
          fontSize: ResponsiveHelper.fontSize(context, base: 13),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: _hasError ? Colors.red.shade300 : Colors.grey.shade300,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: _hasError ? Colors.red : const Color(0xFF5B7FFF),
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }

  Widget _buildRangeSectionInputs() {
    return Row(
      children: [
        // Start section
        Expanded(
          child: TextField(
            controller: _sectionStartController,
            onChanged: (value) {
              _validateRangeSection();
              print('Section start: $value');
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              isDense: true,
              hintText: "Start",
              hintStyle: TextStyle(
                fontSize: ResponsiveHelper.fontSize(context, base: 13),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: _hasError ? Colors.red.shade300 : Colors.grey.shade300,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: _hasError ? Colors.red : const Color(0xFF5B7FFF),
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        Text(
          '-',
          style: TextStyle(
            fontSize: ResponsiveHelper.fontSize(context, base: 16),
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(width: 10),

        // End section
        Expanded(
          child: TextField(
            controller: _sectionEndController,
            onChanged: (value) {
              _validateRangeSection();
              print('Section end: $value');
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              isDense: true,
              hintText: "End",
              hintStyle: TextStyle(
                fontSize: ResponsiveHelper.fontSize(context, base: 13),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: _hasError ? Colors.red.shade300 : Colors.grey.shade300,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: _hasError ? Colors.red : const Color(0xFF5B7FFF),
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
