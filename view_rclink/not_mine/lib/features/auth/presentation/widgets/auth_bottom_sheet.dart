import 'package:flutter/material.dart';
import '../../../../shared/utils/responsive_helper.dart';

class AuthBottomSheet extends StatefulWidget {
  final Widget child;
  final double? heightFactor;
  final AnimationController? controller;
  final VoidCallback? onDismiss;

  const AuthBottomSheet({
    super.key,
    required this.child,
    this.heightFactor,
    this.controller,
    this.onDismiss,
  });

  @override
  State<AuthBottomSheet> createState() => _AuthBottomSheetState();
}

class _AuthBottomSheetState extends State<AuthBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        widget.controller ??
        AnimationController(
          duration: const Duration(milliseconds: 600),
          vsync: this,
        );

    _slideAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start animation after a short delay
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate responsive height
    final sheetHeight =
        widget.heightFactor ??
        ResponsiveHelper.adaptive<double>(
          context,
          mobile: 0.75,
          tablet: 0.65,
          desktop: 0.6,
        );

    final borderRadius = ResponsiveHelper.borderRadius(
      context,
      topLeft: 24,
      topRight: 24,
    );

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Transform.translate(
            offset: Offset(
              0,
              screenHeight * sheetHeight * _slideAnimation.value,
            ),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Center(
                child: Container(
                  constraints: ResponsiveHelper.adaptive(
                    context,
                    mobile: const BoxConstraints(maxWidth: double.infinity),
                    tablet: const BoxConstraints(maxWidth: 600),
                    desktop: const BoxConstraints(maxWidth: 500),
                  ),
                  child: Container(
                    height: screenHeight * sheetHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: borderRadius,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: borderRadius,
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Animated Page Switcher for Auth Screens
class AuthPageSwitcher extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const AuthPageSwitcher({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position:
              Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOutCubic,
                ),
              ),
          child: child,
        );
      },
      child: child,
    );
  }
}

// Responsive Background with Image
class AuthBackground extends StatelessWidget {
  final String imagePath;
  final Widget child;
  final AnimationController? fadeController;

  const AuthBackground({
    super.key,
    required this.imagePath,
    required this.child,
    this.fadeController,
  });

  @override
  Widget build(BuildContext context) {
    Widget background = Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );

    if (fadeController != null) {
      final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: fadeController!, curve: Curves.easeInOut),
      );

      background = AnimatedBuilder(
        animation: fadeController!,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                opacity: fadeAnimation.value,
              ),
            ),
          );
        },
      );
    }

    return Stack(children: [background, child]);
  }
}

// Logo Widget
class AuthLogo extends StatelessWidget {
  final String logoPath;
  final double? height;
  final double? width;
  final AnimationController? fadeController;

  const AuthLogo({
    super.key,
    required this.logoPath,
    this.height,
    this.width,
    this.fadeController,
  });

  @override
  Widget build(BuildContext context) {
    final logoHeight =
        height ??
        ResponsiveHelper.adaptive<double>(
          context,
          mobile: 80,
          tablet: 100,
          desktop: 120,
        );

    final logoWidth =
        width ??
        ResponsiveHelper.adaptive<double>(
          context,
          mobile: 160,
          tablet: 200,
          desktop: 240,
        );

    Widget logo = Image.asset(
      logoPath,
      height: logoHeight,
      width: logoWidth,
      fit: BoxFit.contain,
    );

    if (fadeController != null) {
      final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: fadeController!, curve: Curves.easeInOut),
      );

      logo = FadeTransition(opacity: fadeAnimation, child: logo);
    }

    return Container(
      margin: EdgeInsets.only(bottom: ResponsiveHelper.spacing(context, 50)),
      child: logo,
    );
  }
}
