import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatepay_app/shared/utils/theme.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/route_constants.dart';
import '../../../../shared/utils/responsive_helper.dart';
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
    // final size = MediaQuery.of(context).size;
    // final w = size.width;
    // final h = size.height;

    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state.isCompleted) {
          context.pushReplacement(AppRoutePath.login);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: ResponsiveHelper.getHeight(context, 0.5),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 2 / 40,
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
                      ),
                      _buildOnboardingPage(
                        imagePath: 'assets/images/pageview-2.png',
                        title: localization.get(
                          'onboarding.flexibleEscrow.title',
                        ),
                        description: localization.get(
                          'onboarding.flexibleEscrow.description',
                        ),
                      ),
                      _buildOnboardingPage(
                        imagePath: 'assets/images/pageview-3.png',
                        title: localization.get(
                          'onboarding.referAndEarn.title',
                        ),
                        description: localization.get(
                          'onboarding.referAndEarn.description',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              DotsIndicator(
                mainAxisAlignment: MainAxisAlignment.center,
                reversed: false,
                dotsCount: 3,
                position: currentPageValue,
                decorator: DotsDecorator(
                  color: tPrimaryColor.withOpacity(0.2),
                  activeColor: tPrimaryColor,
                  size: const Size.square(8.0),
                  activeSize: const Size(30.0, 10.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  spacing: const EdgeInsets.all(4),
                ),
              ),

              SizedBox(height: ResponsiveHelper.getHeight(context, 0.06)),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: ResponsiveHelper.getHeight(context, 0.06),
                        child: ElevatedButton(
                          onPressed: () {
                            context.push(AppRoutePath.register);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tPrimaryColor,
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
                            localization.auth('signUp'),
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      child: SizedBox(
                        height: ResponsiveHelper.getHeight(context, 0.06),
                        child: ElevatedButton(
                          onPressed: () {
                            context.push(AppRoutePath.login);
                          },
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: tPrimaryColor,
                              width: ResponsiveHelper.adaptive(
                                context,
                                mobile: 1.0,
                                tablet: 1.5,
                                desktop: 2.0,
                              ),
                            ),
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
                          ),
                          child: Text(
                            localization.auth('signIn'),
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                              fontWeight: FontWeight.w600,
                              color: tPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Column(
      children: [
        SizedBox(
          height: ResponsiveHelper.getHeight(context, 0.3),
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveHelper.fontSize(context, base: 14),
            fontFamily: 'Poppins',
            color: rprimaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          description,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            fontSize: ResponsiveHelper.fontSize(context, base: 14),
            color: rprimaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
