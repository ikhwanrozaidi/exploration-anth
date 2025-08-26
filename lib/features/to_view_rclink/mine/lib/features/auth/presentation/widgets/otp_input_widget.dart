import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';

class OtpInputWidget extends StatefulWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final Function(String value, int index) onChanged;
  final bool isLoading;
  final VoidCallback? onCompleted;

  const OtpInputWidget({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.onChanged,
    this.isLoading = false,
    this.onCompleted,
  });

  @override
  State<OtpInputWidget> createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive box size
        final boxSize = _calculateBoxSize(context, constraints);
        final spacing = ResponsiveHelper.adaptive<double>(
          context,
          mobile: 6,
          tablet: 10,
          desktop: 12,
        );
        
        return Container(
          constraints: ResponsiveHelper.isTablet(context) || ResponsiveHelper.isDesktop(context)
              ? const BoxConstraints(maxWidth: 450)
              : const BoxConstraints(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: spacing / 2),
                child: _buildOtpBox(context, index, boxSize),
              );
            }),
          ),
        );
      },
    );
  }

  double _calculateBoxSize(BuildContext context, BoxConstraints constraints) {
    final deviceType = ResponsiveHelper.getDeviceType(context);
    
    switch (deviceType) {
      case DeviceType.mobile:
        // Calculate based on available width
        final totalSpacing = 6 * ResponsiveHelper.spacing(context, 6);
        final availableWidth = constraints.maxWidth - totalSpacing ; // 48 for padding
        final calculatedSize = availableWidth / 6;
        // Clamp between min and max for mobile
        return calculatedSize.clamp(40.0, 55.0);
        
      case DeviceType.tablet:
        // Fixed size for tablets
        return 65.0;
        
      case DeviceType.desktop:
        // Fixed size for desktop
        return 70.0;
    }
  }

  Widget _buildOtpBox(BuildContext context, int index, double boxSize) {
    final fontSize = ResponsiveHelper.adaptive<double>(
      context,
      mobile: 20,
      tablet: 24,
      desktop: 28,
    );
    
    final borderRadius = ResponsiveHelper.borderRadius(context, all: 12);
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: boxSize,
      height: boxSize,
      decoration: BoxDecoration(
        color: widget.controllers[index].text.isNotEmpty
            ? primaryColor.withValues(alpha: 0.05)
            : Colors.white,
        border: Border.all(
          color: _getBorderColor(index),
          width: widget.controllers[index].text.isNotEmpty ? 2 : 1.5,
        ),
        borderRadius: borderRadius,
        boxShadow: widget.focusNodes[index].hasFocus
            ? [
                BoxShadow(
                  color: primaryColor.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : [],
      ),
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) {
          if (event is RawKeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.backspace) {
              // Handle backspace when current field is empty
              if (widget.controllers[index].text.isEmpty && index > 0) {
                // Move to previous field and clear it
                widget.focusNodes[index - 1].requestFocus();
                widget.controllers[index - 1].clear();
                setState(() {});
              }
            }
          }
        },
        child: TextField(
          controller: widget.controllers[index],
          focusNode: widget.focusNodes[index],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          keyboardType: TextInputType.number,
          textInputAction: index < 5 ? TextInputAction.next : TextInputAction.done,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '',
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (value) {
            setState(() {});
            _handleOtpInput(value, index);
          },
          onTap: () {
            // Select all text when tapped
            widget.controllers[index].selection = TextSelection.fromPosition(
              TextPosition(offset: widget.controllers[index].text.length),
            );
          },
          enabled: !widget.isLoading,
        ),
      ),
    );
  }

  Color _getBorderColor(int index) {
    if (widget.isLoading) {
      return Colors.grey[300]!;
    }
    
    if (widget.focusNodes[index].hasFocus) {
      return primaryColor;
    }
    
    if (widget.controllers[index].text.isNotEmpty) {
      return primaryColor.withValues(alpha: 0.7);
    }
    
    return Colors.grey[300]!;
  }

  void _handleOtpInput(String value, int index) {
    widget.onChanged(value, index);
    
    // Auto-focus management
    if (value.isNotEmpty) {
      // When a digit is entered, move to next field
      if (index < 5) {
        widget.focusNodes[index + 1].requestFocus();
      } else {
        // Last box filled, unfocus and trigger completion
        widget.focusNodes[index].unfocus();
        _checkCompletion();
      }
    }
    // Note: Backspace handling is now done in RawKeyboardListener
  }

  void _checkCompletion() {
    bool allFilled = widget.controllers.every(
      (controller) => controller.text.isNotEmpty,
    );
    
    if (allFilled && widget.onCompleted != null && !widget.isLoading) {
      widget.onCompleted!();
    }
  }
}

// Responsive OTP Display Widget (for showing masked OTP)
class OtpDisplayWidget extends StatelessWidget {
  final String phoneNumber;
  final bool showFullNumber;

  const OtpDisplayWidget({
    super.key,
    required this.phoneNumber,
    this.showFullNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = ResponsiveHelper.adaptive<double>(
      context,
      mobile: 14,
      tablet: 16,
      desktop: 18,
    );
    
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.grey[700],
        ),
        children: [
          const TextSpan(text: 'Please enter the 6 digit code sent to\n'),
          TextSpan(
            text: showFullNumber 
                ? phoneNumber 
                : _maskPhoneNumber(phoneNumber),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }

  String _maskPhoneNumber(String phone) {
    if (phone.length <= 4) return phone;
    final visibleDigits = phone.substring(phone.length - 4);
    final maskedPortion = '*' * (phone.length - 4);
    return '$maskedPortion$visibleDigits';
  }
}