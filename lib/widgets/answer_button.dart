import 'package:flutter/material.dart';
import 'dart:math';

class AnswerButton extends StatefulWidget {
  final String text;
  final Color baseColor;
  final bool isCorrect;
  final bool hasAnswered;
  final bool showResults;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerButton({
    super.key,
    required this.text,
    required this.baseColor,
    required this.isCorrect,
    required this.hasAnswered,
    required this.showResults,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = Tween<double>(begin: 0, end: pi).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant AnswerButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showResults && !oldWidget.showResults && !widget.isSelected) {
      _controller.forward();
    } else if (!widget.hasAnswered && oldWidget.hasAnswered) {
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(_animation.value);

        final isFlipped = _animation.value >= pi / 2;

        Color buttonColor = widget.baseColor;

        if (widget.hasAnswered && widget.isSelected) {
          buttonColor = widget.isCorrect
              ? Color(0xFF4CAF50)
              : const Color(0xFFE57373);
        }

        if (isFlipped && !widget.isSelected) {
          buttonColor = widget.isCorrect
              ? Color(0xFF4CAF50)
              : const Color(0xFFE57373);

          transform.rotateY(pi);
        }
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(16),
            splashColor: Colors.white.withValues(alpha: 0.2),
            highlightColor: Colors.white.withValues(alpha: 0.08),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: buttonColor,
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
      },
    );
  }
}
