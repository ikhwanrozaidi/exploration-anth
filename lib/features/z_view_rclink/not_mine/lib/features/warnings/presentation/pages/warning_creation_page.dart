import 'package:flutter/material.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../widgets/warning_creation_form.dart';

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
  String? selectedWorkScopeUID;
  String? selectedWorkScopeCode;
  String? selectedWorkScopeName;

  String selectedWeatherDisplay = '';
  final TextEditingController _sectionController = TextEditingController();
  bool hasError = false;
  late Road selectedRoad;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
      });
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
                        if (_currentPage > 0) {
                          _goToPreviousPage();
                        } else {
                          Navigator.pop(context);
                        }
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
                        fontSize: ResponsiveHelper.fontSize(context, base: 18),
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
                      const Expanded(child: WarningCreationForm()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
