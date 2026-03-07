import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trivia/data/questions.dart';
import 'package:trivia/models/question.dart';
import 'package:trivia/widgets/answer_button.dart';
import 'package:trivia/widgets/progress_bar.dart';
import 'package:trivia/widgets/timer.dart';
import 'package:trivia/screens/results_screen.dart';
import 'package:trivia/widgets/background_overlay.dart';

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
  int? selectedAnswerIndex;

  // temporizador
  Timer? _timer;
  int timeLeft = 10;
  final int totalTime = 10;

  // lista de preguntas y respuestas
  List<Question> selectedQuestions = [];
  List<Answer> currentAnswers = [];

  final List<String> backgrounds = [
    "assets/images/bg1.png",
    "assets/images/bg2.png",
    "assets/images/bg3.png",
    "assets/images/bg4.png",
    "assets/images/bg5.png",
    "assets/images/bg6.png",
    "assets/images/bg7.png",
    "assets/images/bg8.png",
    "assets/images/bg9.png",
    "assets/images/bg10.png",
  ];

  // colores de los botones de respuesta
  List<Color> answerColors = [
    Color(0xFFB8E6D5),
    Color(0xFFC8E6C9),
    Color(0xFFB7C7EB),
    Color(0xFFE1BEE7),
  ];

  @override
  void initState() {
    super.initState();
    selectedQuestions = questions;
    loadQuestion();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Color getOverlayColor() {
    if (timeLeft <= 3) {
      return Colors.red.withValues(alpha: 0.35);
    }

    if (timeLeft <= 6) {
      return Colors.yellow.withValues(alpha: 0.25);
    }

    return Colors.transparent;
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

  void loadQuestion() {
    currentAnswers = selectedQuestions[currentQuestionIndex].answers;
  }

  void handleTimeout() {
    setState(() {
      hasAnswered = true;
      wrongAnswersCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // contenido
      body: Stack(
        children: [
          // fondo degradado
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF003DA5).withValues(alpha: 0.9),
                  Color(0xFF002A75).withValues(alpha: 0.9),
                  Color(0xFF001F5C).withValues(alpha: 0.9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // imagen de fondo
          Opacity(
            opacity: 0.18,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                backgrounds[currentQuestionIndex % backgrounds.length],
                key: ValueKey(currentQuestionIndex),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
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
                    totalQuestions: selectedQuestions.length,
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
                            selectedQuestions[currentQuestionIndex]
                                .question, //TODO: agregar pregunta
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
                          text: currentAnswers[index]
                              .text, //TODO: agregar respuestas,
                          baseColor: answerColors[index],
                          isCorrect: currentAnswers[index].isCorrect,
                          hasAnswered: hasAnswered,
                          isSelected: selectedAnswerIndex == index,
                          onTap: () {
                            if (hasAnswered) return;
                            setState(() {
                              hasAnswered = true;
                              selectedAnswerIndex = index;
                              if (currentAnswers[index].isCorrect) {
                                correctAnswersCount++;
                              } else {
                                wrongAnswersCount++;
                              }
                            });

                            _timer?.cancel();
                          },
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
                      onPressed: () {
                        if (currentQuestionIndex <
                            selectedQuestions.length - 1) {
                          setState(() {
                            currentQuestionIndex++;
                            hasAnswered = false;
                            selectedAnswerIndex = null;
                          });

                          loadQuestion();
                          startTimer();
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ResultScreen(
                                correct: correctAnswersCount,
                                wrong: wrongAnswersCount,
                                total: selectedQuestions.length,
                              ),
                            ),
                          );
                        }
                      },
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
          Positioned.fill(child: BackgroundOverlay(timeLeft: timeLeft)),
        ],
      ),
    );
  }
}
