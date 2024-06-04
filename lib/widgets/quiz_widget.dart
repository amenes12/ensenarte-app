import 'package:ensenarte/models/quiz_item.dart';
import 'package:ensenarte/utils/learning_item_provider.dart';
import 'package:ensenarte/utils/quiz_generator.dart';
import 'package:flutter/material.dart';

enum AnswerStatus { correct, incorrect, none }

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  late QuizItem currentQuiz;
  int score = 0;
  int totalQuizzes = 0;
  bool isLoading = false;
  AnswerStatus answerStatus = AnswerStatus.none;

  @override
  void initState() {
    super.initState();
    currentQuiz = generateQuiz(LearningItemProvider.getAllLearningItems());
  }

  Future<void> checkAnswer(String selectedAnswer) async {
    totalQuizzes++;

    if (currentQuiz.correctAnswer == selectedAnswer) {
      answerStatus = AnswerStatus.correct;
      score++;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Correcto!'),
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      answerStatus = AnswerStatus.incorrect;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('¡Incorrecto!'),
        duration: Duration(seconds: 1),
      ));
    }
    setState(() {
      isLoading = true;
    });

    // Short delay to show loading spinner before generating new quiz
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      currentQuiz = generateQuiz(LearningItemProvider.getAllLearningItems());
      answerStatus = AnswerStatus.none;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (answerStatus != AnswerStatus.none)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              answerStatus == AnswerStatus.correct
                  ? Icons.check_circle
                  : Icons.cancel,
              color: answerStatus == AnswerStatus.correct
                  ? Colors.green
                  : Colors.red,
              size: 72.0,
            ),
          ),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Image.asset(currentQuiz.resourceToLoadRoute),
            ),
          ),
        ),
        if (!isLoading)
          ...currentQuiz.options.map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: MediaQuery.of(context).size.height * 0.075,
                child: ElevatedButton(
                  onPressed: () => checkAnswer(option),
                  child: Text(
                    option,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            );
          }),
        const Spacer(),
      ],
    );
  }
}
