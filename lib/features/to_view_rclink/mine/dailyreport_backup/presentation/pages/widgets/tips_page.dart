import 'package:flutter/material.dart';
import 'package:rclink_app/features/daily_report_detail/presentation/pages/daily_report_detail_page.dart';

import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../draft_report_creation_page.dart';

class TipsOnboardingPage extends StatefulWidget {
  // Add these parameters
  final String scopeOfWork;
  final String weather;
  final String location;
  final String section;

  const TipsOnboardingPage({
    Key? key,
    required this.scopeOfWork,
    required this.weather,
    required this.location,
    required this.section,
  }) : super(key: key);

  @override
  State<TipsOnboardingPage> createState() => _TipsOnboardingPageState();
}

class _TipsOnboardingPageState extends State<TipsOnboardingPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  final int _maxPages = 3;

  // Sample data for the tips
  final List<TipData> _tips = [
    TipData(
      title: "Safety",
      description:
          "Please make sure you wear a safety vest and helmet before starting work.",
      imagePath: "assets/images/tips1_safety.png",
    ),
    TipData(
      title: "Weather",
      description:
          "Please make sure to stop working when the weather is not good.",
      imagePath: "assets/images/tips2_weather.png",
    ),
    TipData(
      title: "Traffic Management Plan",
      description:
          "Place the safety equipment according to the plan before starting work.",
      imagePath: "assets/images/tips3_trafficplan.png",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _maxPages - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _exitPage() {
    Navigator.of(context).pop();
  }

  void _proceed() {
    // Navigate to DraftDailyReportPage with the parameters
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => DraftDailyReportPage(
          scopeOfWork: widget.scopeOfWork,
          weather: widget.weather,
          location: widget.location,
          section: widget.section,
        ),
      ),
    );
  }

  void _openPlan() {
    // Navigate to DailyReportDetailPage for viewing plan
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => DailyReportDetailPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Tips',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: _exitPage,
        ),
      ),
      body: Column(
        children: [
          // PageView content
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: _maxPages,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image container
                      Container(
                        width: 300,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Image.asset(
                            _tips[index].imagePath,
                            width: 500,
                            height: 450,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Title
                      Text(
                        _tips[index].title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 10),

                      // Description
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          _tips[index].description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Page indicator dots
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_maxPages, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 8 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.black
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),

          // Bottom buttons
          Padding(
            padding: EdgeInsets.all(30),
            child: _currentPage == _maxPages - 1
                ? _buildFinalPageButtons()
                : _buildNextButton(),
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildTipImage(int index) {
    IconData iconData;
    switch (index) {
      case 0:
        iconData = Icons.security;
        break;
      case 1:
        iconData = Icons.build;
        break;
      case 2:
        iconData = Icons.chat;
        break;
      default:
        iconData = Icons.info;
    }

    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.orange[100],
        shape: BoxShape.circle,
      ),
      child: Icon(iconData, size: 60, color: Colors.orange[600]),
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _nextPage();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          padding: ResponsiveHelper.padding(context, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
            fontSize: ResponsiveHelper.fontSize(context, base: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildFinalPageButtons() {
    return Row(
      children: [
        // Open Plan button
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _openPlan,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: primaryColor),
                padding: ResponsiveHelper.padding(context, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: Text(
                'Open Plan',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: ResponsiveHelper.fontSize(context, base: 14),
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: 16),

        // Next button (now goes to DraftDailyReportPage)
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _proceed,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: ResponsiveHelper.padding(context, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ResponsiveHelper.fontSize(context, base: 14),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Data model for tips
class TipData {
  final String title;
  final String description;
  final String imagePath;

  TipData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
