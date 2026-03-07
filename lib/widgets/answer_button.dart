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
      return const Color(0xFF4CAF50);
    }

    if (widget.isSelected && !widget.isCorrect) {
      return const Color(0xFFE57373);
    }

    return const Color(0xFFE3ECFF);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: widget.isSelected ? 0.97 : 1,
      duration: const Duration(milliseconds: 120),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: Colors.white.withValues(alpha: 0.2),
        highlightColor: Colors.white.withValues(alpha: 0.08),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: getButtonColor(),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.35),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF364153),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
