import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trivia/models/question.dart';
import 'package:trivia/widgets/answer_button.dart';
import 'package:trivia/widgets/progress_bar.dart';
import 'package:trivia/widgets/timer.dart';

class TriviaScreen extends StatefulWidget {
  const TriviaScreen({super.key});

  @override
  State<TriviaScreen> createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  bool hasAnswered = false;

  // contadores de respuestas
  int wrongAnswersCount = 0;
  int correctAnswersCount = 0;
  int currentQuestionIndex = 0;

  // temporizador
  Timer? _timer;
  int timeLeft = 10;
  final int totalTime = 10;

  // lista de preguntas y respuestas
  List<Question> selectedQuestions = [];
  List<Answer> currentAnswers = [];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // temporizador
  void startTimer() {
    _timer?.cancel();
    timeLeft = totalTime;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
          handleTimeout();
        }
      });
    });
  }

  void handleTimeout() {
    setState(() {
      hasAnswered = true;
      wrongAnswersCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
    // contenido
    Scaffold(
      body: Stack(
        children: [
          // fondo degradado
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xB27B9FD3),
                    Color(0xA59BB7D9),
                    Color(0xB2B5CAE0),
                  ],
                ),
              ),
            ),
          ),

          // imagen de fondo
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset("assets/images/bg1.png", fit: BoxFit.cover),
            ),
          ),

          // contenido
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TimerDisplay(timeLeft: timeLeft, totalTime: totalTime),
                      const Text(
                        "Trivia",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
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
                        child: Column(
                          children: [
                            const Text(
                              "Puntaje",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF616A78),
                              ),
                            ),

                            // puntaje
                            Text(
                              "$correctAnswersCount",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E2939),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // barra de progreso
                  ProgressBar(
                    currentQuestionIndex: currentQuestionIndex + 1,
                    totalQuestions: 10,
                  ),
                  const SizedBox(height: 100),

                  // pregunta
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white.withOpacity(0.9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0.0, 20.0),
                            blurRadius: 25,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0.0, 8.0),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Text(
                            "pregunta", //TODO: agregar pregunta
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E2939),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // grid de respuestas
                  Expanded(
                    flex: 3,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1.5,
                          ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return AnswerButton(
                          text: "respuesta", //TODO: agregar respuestas,
                          baseColor: Colors.white,
                          isCorrect: false,
                          hasAnswered: hasAnswered,
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 100),

                  // botón siguiente
                  if (hasAnswered)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.9),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadowColor: Colors.black.withOpacity(0.1),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Siguiente",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF1E2939),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xFF1E2939),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
