import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatepay_app/shared/utils/theme.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../locale/presentation/widgets/app_localization.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import '../bloc/onboarding_state.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController pageController;
  Timer? _timer;
  double currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    _startAutoSwipe();
    pageController.addListener(_pageScrollListener);
    // Initialize onboarding
    context.read<OnboardingBloc>().add(const OnboardingStarted());
  }

  void _startAutoSwipe() {
    const period = Duration(seconds: 5);
    const maxPage = 2;
    bool goingForward = true;

    _timer = Timer.periodic(period, (timer) {
      if (!mounted) return;

      const pageDuration = Duration(milliseconds: 800);
      if (goingForward) {
        if ((pageController.page?.round() ?? 0) < maxPage) {
          pageController.nextPage(
            duration: pageDuration,
            curve: Curves.easeInOut,
          );
        } else {
          goingForward = false;
          pageController.previousPage(
            duration: pageDuration,
            curve: Curves.easeInOut,
          );
        }
      } else {
        if ((pageController.page?.round() ?? 0) > 0) {
          pageController.previousPage(
            duration: pageDuration,
            curve: Curves.easeInOut,
          );
        } else {
          goingForward = true;
          pageController.nextPage(
            duration: pageDuration,
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    pageController.removeListener(_pageScrollListener);
    pageController.dispose();
    super.dispose();
  }

  void _pageScrollListener() {
    if (mounted) {
      setState(() {
        currentPageValue = pageController.page ?? 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state.isCompleted) {
          // Navigate to login page after onboarding completion
          context.pushReplacement(AppRoutePath.login);
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color.fromARGB(255, 79, 191, 231), Color.fromARGB(255, 112, 255, 248),],
              stops: [0.0, 0.6, 1.0],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: h / 40,
                      right: 40.0,
                      left: 40.0,
                    ),
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      reverse: false,
                      onPageChanged: (index) {
                        context.read<OnboardingBloc>().add(
                          OnboardingPageChanged(index),
                        );
                      },
                      controller: pageController,
                      pageSnapping: true,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        _buildOnboardingPage(
                          imagePath: 'assets/images/pageview-1.png',
                          title: localization.get(
                            'onboarding.secureTransaction.title',
                          ),
                          description: localization.get(
                            'onboarding.secureTransaction.description',
                          ),
                          w: w,
                          h: h,
                        ),
                        _buildOnboardingPage(
                          imagePath: 'assets/images/pageview-2.png',
                          title: localization.get(
                            'onboarding.flexibleEscrow.title',
                          ),
                          description: localization.get(
                            'onboarding.flexibleEscrow.description',
                          ),
                          w: w,
                          h: h,
                        ),
                        _buildOnboardingPage(
                          imagePath: 'assets/images/pageview-3.png',
                          title: localization.get(
                            'onboarding.referAndEarn.title',
                          ),
                          description: localization.get(
                            'onboarding.referAndEarn.description',
                          ),
                          w: w,
                          h: h,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),

                DotsIndicator(
                  mainAxisAlignment: MainAxisAlignment.center,
                  reversed: false,
                  dotsCount: 3,
                  position: currentPageValue,
                  decorator: DotsDecorator(
                    color: Colors.white,
                    activeColor: tPrimaryColor,
                    size: const Size.square(8.0),
                    activeSize: const Size(30.0, 10.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    spacing: const EdgeInsets.all(4),
                  ),
                ),

                SizedBox(height: w * 0.1),

                _buildActionButtons(context, localization, w),

                SizedBox(height: w * 0.3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String imagePath,
    required String title,
    required String description,
    required double w,
    required double h,
  }) {
    return Column(
      children: [
        SizedBox(
          width: w * 0.7,
          height: h / 2.8,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey.shade200,
                child: const Icon(
                  Icons.image_not_supported,
                  size: 50,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 40),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Poppins',
            color: Colors.white
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          description,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: Colors.white
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    AppLocalizations localization,
    double w,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        ElevatedButton(
          onPressed: () {
            context.push(AppRoutePath.register);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: tPrimaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
          ),
          child: Text(
            localization.auth('signUp'),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),

        SizedBox(width: 20),

        OutlinedButton(
          onPressed: () {
            context.push(AppRoutePath.login);
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: tPrimaryColor,
            backgroundColor: Colors.white,
            side: BorderSide(color: tPrimaryColor, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
          ),
          child: Text(
            localization.auth('signIn'),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        
      ],
    );
  }
}
