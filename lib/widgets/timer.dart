import 'package:flutter/material.dart';

class TimerDisplay extends StatelessWidget {
  final int timeLeft;
  final int totalTime;

  const TimerDisplay({
    super.key,
    required this.timeLeft,
    required this.totalTime,
  });

  @override
  Widget build(BuildContext context) {
    double progress = timeLeft / totalTime;

    Color progressColor;
    if (progress >= 0.7) {
      progressColor = Colors.green;
    } else if (progress >= 0.4) {
      progressColor = Colors.amber;
    } else {
      progressColor = Colors.red;
    }

    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 8,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          ),
          Center(
            child: Text(
              '$timeLeft',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: progressColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
