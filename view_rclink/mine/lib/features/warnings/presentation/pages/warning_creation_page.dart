import 'package:flutter/material.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../widgets/warning_creation_form.dart';
import 'warning_draft_page.dart';

class WarningCreationPage extends StatefulWidget {
  final String? draftUID; // Optional draft UID for editing drafts
  final bool isNewDraft; // If true, will auto-initialize a draft

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

  @override
  void dispose() {
    super.dispose();
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
                          child: WarningCreationForm(
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
                                _sectionStart = data['sectionStart'] as String?;
                                _sectionEnd = data['sectionEnd'] as String?;
                              });
                            },
                          ),
                        ),

                        SizedBox(
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

                                    final String startSection = _isRangeMode
                                        ? (_sectionStart ?? '')
                                        : (_sectionSingle ?? '');

                                    final String? endSection = _isRangeMode
                                        ? _sectionEnd
                                        : null;

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
                                        builder: (context) => WarningDraftPage(
                                          scopeID: _scopeID!,
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
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

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
