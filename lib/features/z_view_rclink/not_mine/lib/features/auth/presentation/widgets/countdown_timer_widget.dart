import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';

class CountdownTimerWidget extends StatefulWidget {
  final int initialSeconds;
  final VoidCallback? onTimerComplete;
  final VoidCallback? onResendPressed;
  final bool isLoading;

  const CountdownTimerWidget({
    super.key,
    this.initialSeconds = 60,
    this.onTimerComplete,
    this.onResendPressed,
    this.isLoading = false,
  });

  @override
  State<CountdownTimerWidget> createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  Timer? _timer;
  int _secondsRemaining = 0;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _secondsRemaining = widget.initialSeconds;
      _canResend = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
        widget.onTimerComplete?.call();
      }
    });
  }

  String _formatTime() {
    final minutes = _secondsRemaining ~/ 60;
    final seconds = _secondsRemaining % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _handleResend() {
    if (_canResend && !widget.isLoading) {
      widget.onResendPressed?.call();
      _startTimer(); // Restart timer after resend
    }
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = ResponsiveHelper.adaptive<double>(
      context,
      mobile: 14,
      tablet: 16,
      desktop: 18,
    );

    final iconSize = ResponsiveHelper.iconSize(context, base: 20);

    return Column(
      children: [
        Text(
          "Didn't receive code?",
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: ResponsiveHelper.spacing(context, 10)),
        
        // Timer Display
        if (!_canResend) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time,
                size: iconSize,
                color: Colors.grey[600],
              ),
              SizedBox(width: ResponsiveHelper.spacing(context, 8)),
              Text(
                _formatTime(),
                style: TextStyle(
                  fontSize: ResponsiveHelper.adaptive<double>(
                    context,
                    mobile: 18,
                    tablet: 20,
                    desktop: 22,
                  ),
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: ResponsiveHelper.spacing(context, 10)),
        ],
        
        // Resend Button
        AnimatedOpacity(
          opacity: _canResend ? 1.0 : 0.5,
          duration: const Duration(milliseconds: 300),
          child: TextButton(
            onPressed: _canResend && !widget.isLoading ? _handleResend : null,
            style: TextButton.styleFrom(
              padding: ResponsiveHelper.padding(
                context,
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: ResponsiveHelper.borderRadius(context, all: 8),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.isLoading)
                  SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.grey[400]!,
                      ),
                    ),
                  )
                else
                  Icon(
                    Icons.refresh,
                    size: iconSize,
                    color: _canResend ? primaryColor : Colors.grey[400],
                  ),
                SizedBox(width: ResponsiveHelper.spacing(context, 8)),
                Text(
                  'Resend Code',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: _canResend && !widget.isLoading
                        ? primaryColor
                        : Colors.grey[400],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Simple Timer Display Widget (without resend functionality)
class SimpleTimerDisplay extends StatelessWidget {
  final int seconds;
  final String? prefix;

  const SimpleTimerDisplay({
    super.key,
    required this.seconds,
    this.prefix,
  });

  String _formatTime() {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = ResponsiveHelper.adaptive<double>(
      context,
      mobile: 16,
      tablet: 18,
      desktop: 20,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefix != null) ...[
          Text(
            prefix!,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(width: ResponsiveHelper.spacing(context, 8)),
        ],
        Icon(
          Icons.timer,
          size: ResponsiveHelper.iconSize(context, base: 20),
          color: primaryColor,
        ),
        SizedBox(width: ResponsiveHelper.spacing(context, 4)),
        Text(
          _formatTime(),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}