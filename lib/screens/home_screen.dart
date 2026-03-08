import 'dart:math' as math;
import 'dart:ui';
import 'package:trivia/screens/trivia_screen.dart';
import 'package:flutter/material.dart';

class Initialsplash extends StatefulWidget {
  const Initialsplash({super.key});

  @override
  State<Initialsplash> createState() => _InitialsplashState();
}

class _InitialsplashState extends State<Initialsplash> {
  bool _isPressed = false;

  static const Color _bluePrimary = Color(0xFF003DA5);
  static const Color _blueMid = Color(0xFF002A75);
  static const Color _blueDark = Color(0xFF001F5C);
  static const Color _yellowAccent = Color(0xFFF8B700);
  static const Color _yellowLight = Color(0xFFFFD700);
  static const Color _white = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
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
            // Design elements
            _buildBackgroundDecorations(),
            //Main content
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: const Duration(milliseconds: 1300),
                        curve: Curves.easeOut,
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.translate(
                              offset: Offset(0, 30 * (1 - value)),
                              child: child,
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            _buildQuestionMark(),
                            const SizedBox(height: 24),
                            _buildUnisonLogo(),
                            const SizedBox(height: 24),
                            const Text(
                              'TriviaSON',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Universidad de Sonora',
                              style: TextStyle(
                                color: _yellowAccent,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 32),
                            _buildFeatureCard(
                              icon: Icons.access_time,
                              title: 'Preguntas cronometradas',
                              subtitle: 'Tiempo limite de respuesta',
                            ),
                            const SizedBox(height: 12),
                            _buildFeatureCard(
                              icon: Icons.lightbulb,
                              title: 'Conocimiento académico',
                              subtitle: 'Preguntas para universitarios',
                            ),
                            const SizedBox(height: 37),
                            _buildStartButton(context),
                            const SizedBox(height: 40),
                            _buildTeamSection(),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundDecorations() {
    return Positioned.fill(
      child: Stack(
        children: [
          //more design background
          Center(
            child: Opacity(
              opacity: 0.05,
              child: SizedBox(
                width: 320,
                height: 320,
                child: CustomPaint(painter: _backPainter()),
              ),
            ),
          ),
          //points of the background
          Positioned(
            top: 80,
            left: 40,
            child: _buildFloatingDot(8, _yellowAccent, 0.4),
          ),
          Positioned(
            top: 160,
            right: 64,
            child: _buildFloatingDot(12, Colors.white, 0.3),
          ),
          Positioned(
            bottom: 200,
            left: 48,
            child: _buildFloatingDot(8, _yellowAccent, 0.4),
          ),
          Positioned(
            bottom: 280,
            right: 40,
            child: _buildFloatingDot(8, Colors.white, 0.3),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingDot(double size, Color color, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withAlpha((opacity * 255).toInt()),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildQuestionMark() {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.25),
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.08),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.15),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Icon(
              Icons.question_mark,
              size: 38,
              color: _yellowAccent,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUnisonLogo() {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.3),
            blurRadius: 24,
            offset: Offset(0, 15),
          ),
        ],
      ),
      child: Image.asset('assets/images/Logouson.png', fit: BoxFit.cover),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _yellowAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 20, color: _bluePrimary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(999),
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [_yellowAccent, _yellowLight],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(999),
          boxShadow: [
            BoxShadow(
              color: _yellowAccent.withValues(alpha: _isPressed ? 0.2 : 0.4),
              blurRadius: _isPressed ? 10 : 25,
              offset: Offset(0, _isPressed ? 4 : 10),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onHighlightChanged: (value) {
            setState(() {
              _isPressed = value;
            });
          },
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TriviaScreen()),
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
            transform: Matrix4.identity()
              ..scaleByDouble(
                _isPressed ? 0.95 : 1.0, // x
                _isPressed ? 0.95 : 1.0, // y
                1.0, // z
                1.0,
              ),
            padding: const EdgeInsets.symmetric(vertical: 18),
            alignment: Alignment.center,
            child: const Text(
              'Iniciar',
              style: TextStyle(
                color: _white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamSection() {
    return Column(
      children: [
        Text(
          'Equipo de desarrollo:',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.5),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, color: _yellowAccent, size: 16),
            const SizedBox(width: 6),
            const Text(
              'Arce Gaxiola Angel Eduardo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, color: _yellowAccent, size: 16),
            const SizedBox(width: 6),
            const Text(
              'Montaño Lares Jessica',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Build background interrogation simbole
class _backPainter extends CustomPainter {
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
    final radius = size.width / 2;
    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(center.dx, center.dy - radius * 0.15),
        radius: radius * 0.35,
      ),
      math.pi * 0.9,
      math.pi * 0.8,
      false,
      paint,
    );

    canvas.drawLine(
      Offset(center.dx, center.dy + radius * 0.20),
      Offset(center.dx, center.dy + radius * 0.40),
      paint,
    );

    canvas.drawCircle(
      Offset(center.dx, center.dy + radius * 0.55),
      8,
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
