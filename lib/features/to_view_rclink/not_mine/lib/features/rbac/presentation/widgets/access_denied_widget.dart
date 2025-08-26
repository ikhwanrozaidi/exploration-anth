import 'package:flutter/material.dart';

class AccessDeniedWidget extends StatelessWidget {
  final String message;
  final String? subtitle;
  final VoidCallback? onGoBack;
  final IconData icon;
  final Color? iconColor;

  const AccessDeniedWidget({
    super.key,
    this.message = 'Access Denied',
    this.subtitle,
    this.onGoBack,
    this.icon = Icons.lock_outline,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: (iconColor ?? colorScheme.error).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 64,
                color: iconColor ?? colorScheme.error,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              message,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (onGoBack != null) ...[
              const SizedBox(height: 32),
              FilledButton.tonal(
                onPressed: onGoBack,
                child: const Text('Go Back'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Compact version for inline use
class CompactAccessDeniedWidget extends StatelessWidget {
  final String message;
  final IconData icon;

  const CompactAccessDeniedWidget({
    super.key,
    this.message = 'No access',
    this.icon = Icons.lock_outline,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20,
            color: colorScheme.onErrorContainer,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}