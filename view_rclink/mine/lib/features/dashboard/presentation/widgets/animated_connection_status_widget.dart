import 'package:flutter/material.dart';

class AnimatedConnectionStatus extends StatelessWidget {
  final bool isConnected;
  final Color greenAccent;

  const AnimatedConnectionStatus({
    Key? key,
    required this.isConnected,
    required this.greenAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child),
        );
      },
      child: isConnected
          ? Container(
              key: const ValueKey('connected'),
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: greenAccent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: greenAccent.withOpacity(0.5),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
            )
          : Container(
              key: const ValueKey('disconnected'),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text('Offline', style: TextStyle(color: Colors.red)),
            ),
    );
  }
}
