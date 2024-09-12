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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Image.asset(
                      currentQuiz.resourceToLoadRoute,
                      filterQuality: FilterQuality.medium,
                    ),
            ),
          ),
        ),
        if (!isLoading)
          ...List.generate(currentQuiz.options.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: SizedBox(
                width: width - 70,
                height: height * 0.085,
                child: MaterialButton(
                  onPressed: () => checkAnswer(currentQuiz.options[index]),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.0),
                    side: const BorderSide(
                      color: Color.fromRGBO(97, 137, 255, 1),
                      width: 2.0,
                    ),
                  ),
                  elevation: 4,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.network(
                          currentQuiz.optionsAssets[index],
                          height: height * 0.065,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: Center(
                          child: Text(
                            currentQuiz.options[index],
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
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
