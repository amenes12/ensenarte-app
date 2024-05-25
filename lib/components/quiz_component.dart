import 'package:ensenarte/models/quiz_item.dart';
import 'package:ensenarte/utils/learning_item_provider.dart';
import 'package:ensenarte/utils/quiz_generator.dart';
import 'package:flutter/material.dart';

class QuizComponent extends StatefulWidget {
  const QuizComponent({super.key});

  @override
  State<QuizComponent> createState() => _QuizComponentState();
}

class _QuizComponentState extends State<QuizComponent> {
  late QuizItem currentQuiz;
  int score = 0;
  int totalQuizzes = 0;

  @override
  void initState() {
    super.initState();
    currentQuiz = generateQuiz(LearningItemProvider.getAllLearningItems());
  }

  void checkAnswer(String selectedAnswer) {
    if (currentQuiz.correctAnswer == selectedAnswer) {
      score++;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('!Correcto!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Incorrecto!'),
      ));
    }

    setState(() {
      totalQuizzes++;
      currentQuiz = generateQuiz(LearningItemProvider.getAllLearningItems());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Puntos: $score / $totalQuizzes',
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Image.asset(currentQuiz.resourceToLoadRoute),
          ),
        ),
        ...currentQuiz.options.map((option) {
          return ElevatedButton(
            onPressed: () => checkAnswer(option),
            child: Text(
              option,
            ),
          );
        }),
      ],
    );
  }
}
