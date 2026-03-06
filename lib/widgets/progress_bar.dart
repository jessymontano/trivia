import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int currentQuestionIndex;
  final int totalQuestions;

  const ProgressBar({
    super.key,
    required this.currentQuestionIndex,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentQuestionIndex / totalQuestions;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 12,
            backgroundColor: Color.fromARGB(149, 255, 255, 255),
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Pregunta $currentQuestionIndex de $totalQuestions",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFEFF2F6),
          ),
        ),
      ],
    );
  }
}
