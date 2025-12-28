import 'dart:ui';
import 'package:flutter/material.dart';

/// ===================== HOW TO USE ===========================
///  CustomSnackBar.show(
///        context,
///        'This feature is coming soon...',
///        type: SnackBarType.comingsoon,
///      );
/// =============================================================

enum SnackBarType { success, error, warning, info, validation, comingsoon }

class CustomSnackBar {
  static void show(
    BuildContext context,
    String message, {
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final snackBar = SnackBar(
      content: _buildContent(message, type),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration: duration,
      margin: const EdgeInsets.all(16),
      action: actionLabel != null
          ? SnackBarAction(
              label: actionLabel,
              textColor: Colors.white,
              onPressed: onAction ?? () {},
            )
          : null,
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Widget _buildContent(String message, SnackBarType type) {
    if (type == SnackBarType.error) {
      return _ShakeWidget(child: _buildGlassContainer(message, type));
    }
    return _buildGlassContainer(message, type);
  }

  static Widget _buildGlassContainer(String message, SnackBarType type) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: _getBackgroundColor(type).withOpacity(0.7),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _getTextColor(type).withOpacity(0.2),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _getTextColor(type).withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(_getIcon(type), color: _getTextColor(type), size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: _getTextColor(type),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Color _getBackgroundColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return const Color.fromARGB(255, 196, 255, 198);
      case SnackBarType.error:
        return const Color.fromARGB(255, 255, 192, 192);
      case SnackBarType.warning:
        return const Color.fromARGB(255, 255, 217, 159);
      case SnackBarType.info:
        return const Color.fromARGB(255, 158, 211, 255);
      case SnackBarType.validation:
        return const Color.fromARGB(255, 255, 175, 151);
      case SnackBarType.comingsoon:
        return const Color.fromARGB(255, 255, 255, 255);
    }
  }

  static Color _getTextColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return const Color(0xFF4CAF50);
      case SnackBarType.error:
        return const Color(0xFFE53E3E);
      case SnackBarType.warning:
        return const Color(0xFFFF9800);
      case SnackBarType.info:
        return const Color(0xFF2196F3);
      case SnackBarType.validation:
        return const Color(0xFFFF5722);
      case SnackBarType.comingsoon:
        return const Color.fromARGB(255, 107, 107, 107);
    }
  }

  static IconData _getIcon(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return Icons.check_circle;
      case SnackBarType.error:
        return Icons.error;
      case SnackBarType.warning:
        return Icons.warning;
      case SnackBarType.info:
        return Icons.info;
      case SnackBarType.validation:
        return Icons.warning_amber;
      case SnackBarType.comingsoon:
        return Icons.commit_outlined;
    }
  }
}

class _ShakeWidget extends StatefulWidget {
  final Widget child;

  const _ShakeWidget({required this.child});

  @override
  State<_ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<_ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 10.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 10.0, end: -10.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10.0, end: 10.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 10.0, end: -10.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10.0, end: 0.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
