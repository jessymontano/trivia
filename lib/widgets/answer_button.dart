import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  final String text;
  final Color baseColor;
  final bool isCorrect;
  final bool hasAnswered;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerButton({
    super.key,
    required this.text,
    required this.baseColor,
    required this.isCorrect,
    required this.hasAnswered,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color getButtonColor() {
    if (!widget.hasAnswered) {
      return widget.baseColor;
    }

    if (widget.isCorrect) {
      return Colors.green;
    }

    if (widget.isSelected && !widget.isCorrect) {
      return Colors.red;
    }

    return Colors.grey.shade300;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: getButtonColor(),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0.0, 4.0),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Color(0xFF364153)),
          ),
        ),
      ),
    );
  }
}
