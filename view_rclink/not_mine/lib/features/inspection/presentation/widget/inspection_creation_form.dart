import 'package:flutter/material.dart';
import 'package:rclink_app/shared/utils/theme.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../../../road/presentation/helper/road_level.dart';
import '../../../road/presentation/helper/road_selection_result.dart';
import '../../../road/presentation/pages/road_field_tile.dart';
import '../../../work_scope/presentation/pages/work_scope_field_tile.dart';

class InspectionCreationForm extends StatefulWidget {
  final ValueChanged<bool>? onValidationChanged;
  final ValueChanged<Map<String, dynamic>>? onDataChanged;

  const InspectionCreationForm({
    Key? key,
    this.onValidationChanged,
    this.onDataChanged,
  }) : super(key: key);

  @override
  State<InspectionCreationForm> createState() => _InspectionCreationFormState();
}

class _InspectionCreationFormState extends State<InspectionCreationForm> {
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _sectionStartController = TextEditingController();
  final TextEditingController _sectionEndController = TextEditingController();

  bool _isRangeMode = false;
  bool _hasError = false;
  String? _errorMessage;

  double? _roadSectionStart;
  double? _roadSectionFinish;

  String? selectedScopeID;
  String? selectedScopeUID;
  String? selectedScopeName;
  String? selectedLocationDisplay;
  String? selectedSectionValue;
  String? selectedSectionStartValue;
  String? selectedSectionEndValue;
  Road? selectedRoad;

  @override
  void dispose() {
    _sectionController.dispose();
    _sectionStartController.dispose();
    _sectionEndController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    final hasScopeSelected = selectedScopeID != null;
    final hasLocationSelected = selectedLocationDisplay != null;

    bool hasSectionValue;
    if (_isRangeMode) {
      hasSectionValue =
          _sectionStartController.text.isNotEmpty &&
          _sectionEndController.text.isNotEmpty;
    } else {
      hasSectionValue = _sectionController.text.isNotEmpty;
    }

    return hasScopeSelected &&
        hasLocationSelected &&
        hasSectionValue &&
        !_hasError;
  }

  void _notifyValidationChanged() {
    if (widget.onValidationChanged != null) {
      widget.onValidationChanged!(_isFormValid);
    }
  }

  void _notifyDataChanged() {
    if (widget.onDataChanged != null) {
      widget.onDataChanged!({
        'scopeID': selectedScopeID,
        'scopeUID': selectedScopeUID,
        'scopeName': selectedScopeName,
        'road': selectedRoad,
        'isRangeMode': _isRangeMode,
        'sectionSingle': _isRangeMode ? null : _sectionController.text,
        'sectionStart': _isRangeMode ? _sectionStartController.text : null,
        'sectionEnd': _isRangeMode ? _sectionEndController.text : null,
      });
    }
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

    _notifyValidationChanged();
    _notifyDataChanged();
  }

  void _validateSingleSection(String value) {
    if (value.isEmpty) {
      setState(() {
        _hasError = false;
        _errorMessage = null;
      });
      _notifyValidationChanged();
      return;
    }

    final double? section = double.tryParse(value);

    if (section == null) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Invalid number';
      });
      _notifyValidationChanged();
      return;
    }

    if (_roadSectionStart == null || _roadSectionFinish == null) {
      setState(() {
        _hasError = false;
        _errorMessage = null;
      });
      _notifyValidationChanged();
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

    _notifyValidationChanged();
  }

  void _validateRangeSection() {
    final String startValue = _sectionStartController.text;
    final String endValue = _sectionEndController.text;

    if (startValue.isEmpty && endValue.isEmpty) {
      setState(() {
        _hasError = false;
        _errorMessage = null;
      });
      _notifyValidationChanged();
      return;
    }

    final double? startSection = double.tryParse(startValue);
    final double? endSection = double.tryParse(endValue);

    if ((startValue.isNotEmpty && startSection == null) ||
        (endValue.isNotEmpty && endSection == null)) {
      setState(() {
        _hasError = true;
        _errorMessage = 'Invalid number';
      });
      _notifyValidationChanged();
      return;
    }

    if (_roadSectionStart == null || _roadSectionFinish == null) {
      setState(() {
        _hasError = false;
        _errorMessage = null;
      });
      _notifyValidationChanged();
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
      _notifyValidationChanged();
      return;
    }

    if (endSection != null &&
        (endSection < _roadSectionStart! || endSection > _roadSectionFinish!)) {
      setState(() {
        _hasError = true;
        _errorMessage =
            'End section must be between $_roadSectionStart and $_roadSectionFinish';
      });
      _notifyValidationChanged();
      return;
    }

    if (startSection != null &&
        endSection != null &&
        startSection > endSection) {
      setState(() {
        _hasError = true;
        _errorMessage =
            'Start section must be less than or equal to end section';
      });
      _notifyValidationChanged();
      return;
    }

    setState(() {
      _hasError = false;
      _errorMessage = null;
    });

    _notifyValidationChanged();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Change to Categories, this was taken from WarningCreationForm
            WorkScopeFieldTile(
              onScopeSelected: (selectedData) {
                print(
                  'Allow Multiple Quantities: ${selectedData['allowMultipleQuantities']}',
                );

                setState(() {
                  selectedScopeID = selectedData['id'];
                  selectedScopeName = selectedData['name'];
                  selectedScopeUID = selectedData['uid'];
                });

                _notifyValidationChanged();
                _notifyDataChanged();
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

                  selectedRoad = result.selectedRoad;
                  _roadSectionStart = result.selectedRoad?.sectionStart;
                  _roadSectionFinish = result.selectedRoad?.sectionFinish;

                  _hasError = false;
                  _errorMessage = null;
                  _sectionController.clear();
                  _sectionStartController.clear();
                  _sectionEndController.clear();
                });

                _notifyValidationChanged();
                _notifyDataChanged();
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        _isRangeMode
                                            ? 'Range Section'
                                            : 'Section',
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
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
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

                                  _isRangeMode
                                      ? _buildRangeSectionInputs()
                                      : _buildSingleSectionInput(),

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
        ),
      ),
    );
  }

  Widget _buildSingleSectionInput() {
    return TextField(
      controller: _sectionController,
      onChanged: (value) {
        _validateSingleSection(value);
        _notifyDataChanged();
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
      ),
    );
  }

  Widget _buildRangeSectionInputs() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _sectionStartController,
            onChanged: (value) {
              _validateRangeSection();
              _notifyDataChanged();
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

        Expanded(
          child: TextField(
            controller: _sectionEndController,
            onChanged: (value) {
              _validateRangeSection();
              _notifyDataChanged();
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
