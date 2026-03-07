// TODO: crear pantalla de resultados
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:trivia/screens/home_screen.dart';
import 'package:trivia/screens/trivia_screen.dart';

class ResultScreen extends StatelessWidget {
  final int correct;
  final int wrong;
  final int total;

  const ResultScreen({
    super.key,
    required this.correct,
    required this.wrong,
    required this.total,
  });

  static const Color _bluePrimary = Color(0xFF003DA5);
  static const Color _blueMid = Color(0xFF002A75);
  static const Color _blueDark = Color(0xFF001F5C);
  static const Color _yellowAccent = Color(0xFFF8B700);
  static const Color _yellowLight = Color(0xFFFFD700);

  String getMessage() {
    double percent = correct / total;

    if (percent >= 0.8) return "¡Excelente!";
    if (percent >= 0.5) return "Buen trabajo";
    return "Sigue intentando";
  }

  @override
  Widget build(BuildContext context) {
    double percent = (correct / total) * 100;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_bluePrimary, _blueMid, _blueDark],
          ),
        ),
        child: Stack(
          children: [
            _buildBackground(),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 40),

                    ///ICON
                    Container(
                      width: 110,
                      height: 110,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: _yellowAccent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.emoji_events,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),

                    const SizedBox(height: 40),

                    Text(
                      getMessage(),
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Has completado la trivia",
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),

                    const SizedBox(height: 30),

                    ///SCORE CARD
                    _buildScoreCard(percent),

                    const SizedBox(height: 24),

                    ///CORRECT / INCORRECT
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            color: Colors.green,
                            number: correct,
                            label: "CORRECTAS",
                            icon: Icons.check_circle,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildStatCard(
                            color: Colors.red,
                            number: wrong,
                            label: "INCORRECTAS",
                            icon: Icons.cancel,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    ///RESTART BUTTON
                    _buildButton(
                      text: "Intentar de Nuevo",
                      icon: Icons.refresh,
                      color: _yellowAccent,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TriviaScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    ///HOME BUTTON
                    _buildButton(
                      text: "Volver al Inicio",
                      icon: Icons.home,
                      color: Colors.white.withOpacity(0.2),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Initialsplash(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreCard(double percent) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white24),
          ),
          child: Column(
            children: [
              const Text(
                "TU PUNTUACIÓN",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),

              const SizedBox(height: 8),

              Text(
                "$correct/$total",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: _yellowAccent,
                ),
              ),

              const SizedBox(height: 8),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _yellowAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "${percent.toStringAsFixed(0)}% Correctas",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required Color color,
    required int number,
    required String label,
    required IconData icon,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Icon(icon, color: color),
              const SizedBox(height: 6),
              Text(
                number.toString(),
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: const TextStyle(color: Colors.white70, fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(999),
      child: Ink(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(999),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Center(
      child: Opacity(
        opacity: 0.05,
        child: SizedBox(
          width: 320,
          height: 320,
          child: CustomPaint(painter: _BackgroundPainter()),
        ),
      ),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    for (int i = 1; i <= 2; i++) {
      canvas.drawCircle(center, size.width / 2 - (i * 20), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
