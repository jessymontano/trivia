import '../models/question.dart';

// aquí van las preguntas
final List<Question> questions = [
  Question(
    text: "¿Cuál es el nombre completo del profesor de PDSIII?",
    answers: [
      Answer(text: "José Luis Aguilera Lozeno", isCorrect: false),
      Answer(text: "José Luis Armendariz Luzania", isCorrect: false),
      Answer(text: "José Luis Aguilera Lozania", isCorrect: false),
      Answer(text: "José Luis Aguilera Luzania", isCorrect: true),
    ],
  ),
];
