import 'package:flutter/material.dart';

class BackgroundOverlay extends StatelessWidget {
  final int timeLeft;

  const BackgroundOverlay({super.key, required this.timeLeft});

  Color getOverlayColor() {
    if (timeLeft <= 3) {
      return Colors.red.withValues(alpha: 0.42);
    }

    if (timeLeft <= 6) {
      return Colors.yellow.withValues(alpha: 0.30);
    }

    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.transparent, getOverlayColor()],
            stops: const [0.6, 1],
            radius: 1.2,
          ),
        ),
      ),
    );
  }
}
