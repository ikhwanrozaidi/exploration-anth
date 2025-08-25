import 'package:flutter/material.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';

enum AuthButtonType {
  primary,
  secondary,
  text,
}

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final AuthButtonType type;
  final IconData? icon;
  final double? width;
  final EdgeInsets? padding;
  final Color? customColor;

  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.type = AuthButtonType.primary,
    this.icon,
    this.width,
    this.padding,
    this.customColor,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = ResponsiveHelper.adaptive<double>(
      context,
      mobile: 16,
      tablet: 18,
      desktop: 20,
    );

    final buttonPadding = padding ?? ResponsiveHelper.padding(
      context,
      vertical: 16,
      horizontal: 24,
    );

    final borderRadius = ResponsiveHelper.borderRadius(context, all: 14);

    final Widget buttonChild = _buildButtonContent(context, fontSize);

    final buttonWidth = width ?? double.infinity;

    switch (type) {
      case AuthButtonType.primary:
        return SizedBox(
          width: buttonWidth,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: customColor ?? primaryColor,
              disabledBackgroundColor: Colors.grey[300],
              padding: buttonPadding,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
              elevation: ResponsiveHelper.adaptive(
                context,
                mobile: 1,
                tablet: 2,
                desktop: 3,
              ),
            ),
            child: buttonChild,
          ),
        );

      case AuthButtonType.secondary:
        return SizedBox(
          width: buttonWidth,
          child: OutlinedButton(
            onPressed: isLoading ? null : onPressed,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: customColor ?? primaryColor,
                width: ResponsiveHelper.adaptive(
                  context,
                  mobile: 1.0,
                  tablet: 1.5,
                  desktop: 2.0,
                ),
              ),
              padding: buttonPadding,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
            ),
            child: buttonChild,
          ),
        );

      case AuthButtonType.text:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            padding: buttonPadding,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          child: buttonChild,
        );
    }
  }

  Widget _buildButtonContent(BuildContext context, double fontSize) {
    if (isLoading) {
      return SizedBox(
        height: ResponsiveHelper.adaptive(
          context,
          mobile: 20,
          tablet: 24,
          desktop: 28,
        ),
        width: ResponsiveHelper.adaptive(
          context,
          mobile: 20,
          tablet: 24,
          desktop: 28,
        ),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            type == AuthButtonType.primary
                ? Colors.white
                : customColor ?? primaryColor,
          ),
        ),
      );
    }

    final textColor = _getTextColor();

    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: textColor,
            size: ResponsiveHelper.iconSize(context, base: 20),
          ),
          SizedBox(width: ResponsiveHelper.spacing(context, 8)),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Color _getTextColor() {
    if (isLoading) {
      return Colors.grey;
    }

    switch (type) {
      case AuthButtonType.primary:
        return Colors.white;
      case AuthButtonType.secondary:
      case AuthButtonType.text:
        return customColor ?? primaryColor;
    }
  }
}

// Loading Button Widget
class LoadingButton extends StatelessWidget {
  final String text;
  final String loadingText;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;

  const LoadingButton({
    super.key,
    required this.text,
    this.loadingText = 'Loading...',
    required this.onPressed,
    this.isLoading = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AuthButton(
      text: isLoading ? loadingText : text,
      onPressed: onPressed,
      isLoading: isLoading,
      width: width,
      type: AuthButtonType.primary,
    );
  }
}

// Social Auth Button
class SocialAuthButton extends StatelessWidget {
  final String text;
  final String? imagePath;
  final IconData? icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const SocialAuthButton({
    super.key,
    required this.text,
    this.imagePath,
    this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = ResponsiveHelper.adaptive<double>(
      context,
      mobile: 14,
      tablet: 16,
      desktop: 18,
    );

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white,
          side: BorderSide(color: Colors.grey[300]!),
          padding: ResponsiveHelper.padding(
            context,
            vertical: 14,
            horizontal: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: ResponsiveHelper.borderRadius(context, all: 12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath!,
                height: ResponsiveHelper.adaptive(
                  context,
                  mobile: 20,
                  tablet: 24,
                  desktop: 28,
                ),
              )
            else if (icon != null)
              Icon(
                icon,
                size: ResponsiveHelper.iconSize(context, base: 20),
                color: textColor ?? Colors.black87,
              ),
            SizedBox(width: ResponsiveHelper.spacing(context, 12)),
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: textColor ?? Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}