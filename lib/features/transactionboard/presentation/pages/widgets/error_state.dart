// lib/features/transactionboard/presentation/widgets/error_state_widget.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../../../shared/utils/theme.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final String? lottieAssetPath;

  const ErrorStateWidget({
    super.key,
    required this.message,
    required this.onRetry,
    this.lottieAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, cons) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: h / 8),
                if (lottieAssetPath != null)
                  Lottie.asset(
                    lottieAssetPath!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                    repeat: true,
                    animate: true,
                  )
                else
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                const SizedBox(height: 20),
                Text(
                  'Uh-oh!',
                  style: GoogleFonts.poppins(
                    color: tDarkFontShade1,
                    fontWeight: FontWeight.w600,
                    fontSize: w * 0.05,
                  ),
                ),
                Text(
                  'We ran into a problem',
                  style: GoogleFonts.poppins(
                    color: tDarkFontShade1,
                    fontWeight: FontWeight.w600,
                    fontSize: w * 0.04,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    message.isNotEmpty 
                        ? message 
                        : 'Please check your internet connection and try again',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tPrimaryColorShade3,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    minimumSize: const Size(64, 30),
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Try again',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// lib/features/transactionboard/presentation/widgets/empty_state_widget.dart
class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? lottieAssetPath;
  final VoidCallback? onRefresh;

  const EmptyStateWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.lottieAssetPath,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: h / 8),
            if (lottieAssetPath != null)
              Lottie.asset(
                lottieAssetPath!,
                width: 200,
                height: 200,
                fit: BoxFit.fill,
                repeat: true,
                animate: true,
              )
            else
              Icon(
                Icons.inbox_outlined,
                size: 80,
                color: Colors.grey.shade400,
              ),
            const SizedBox(height: 20),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: tDarkFontShade1,
                fontWeight: FontWeight.w600,
                fontSize: w * 0.05,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                ),
              ),
            ),
            if (onRefresh != null) ...[
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: onRefresh,
                style: ElevatedButton.styleFrom(
                  backgroundColor: tPrimaryColorShade3,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  minimumSize: const Size(64, 30),
                  visualDensity: VisualDensity.compact,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Refresh',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}