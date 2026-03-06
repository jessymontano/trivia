import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  final String text;
  final Color baseColor;
  final bool isCorrect;
  final bool hasAnswered;
  final VoidCallback onTap;

  const AnswerButton({
    super.key,
    required this.text,
    required this.baseColor,
    required this.isCorrect,
    required this.hasAnswered,
    required this.onTap,
  });

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: widget.baseColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0.0, 4.0),
            blurRadius: 6,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(2.0, 0.0),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 16, color: Color(0xFF364153)),
        ),
      ),
    );
  }
}
