import 'package:ensenarte/screens/main_screen.dart';
import 'package:ensenarte/utils/get_medal.dart';
import 'package:flutter/material.dart';
import 'package:ensenarte/models/quiz_item.dart';
import 'package:ensenarte/utils/learning_item_provider.dart';
import 'package:ensenarte/utils/quiz_generator.dart'; // Assuming generateQuiz function is here
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AnswerStatus { correct, incorrect, none }

enum Difficulty { easy, medium, hard }

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key});

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  late QuizItem currentQuiz;
  int score = 0;
  int totalQuizzes = 0;
  int maxQuizzes = 0;
  bool isLoading = false;
  AnswerStatus answerStatus = AnswerStatus.none;
  Difficulty? selectedDifficulty;

  @override
  void initState() {
    super.initState();
  }

  void selectDifficulty(Difficulty difficulty) {
    setState(() {
      selectedDifficulty = difficulty;
      switch (difficulty) {
        case Difficulty.easy:
          maxQuizzes = 10;
          break;
        case Difficulty.medium:
          maxQuizzes = 20;
          break;
        case Difficulty.hard:
          maxQuizzes = 30;
          break;
      }
      totalQuizzes = 0; // Reset totalQuizzes
      score = 0; // Reset score

      resetUsedLearningItems(); // Reset usedLearningItems set
      // Fetching all learning items and generating the first quiz
      currentQuiz =
          generateQuiz(LearningItemProvider.getAllLearningItems(), maxQuizzes);
    });
  }

  Future<void> checkAnswer(String selectedAnswer) async {
    if (totalQuizzes >= maxQuizzes) return;

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

    if (totalQuizzes < maxQuizzes) {
      setState(() {
        // Generate the next quiz
        currentQuiz = generateQuiz(
            LearningItemProvider.getAllLearningItems(), maxQuizzes);
        answerStatus = AnswerStatus.none;
        isLoading = false;
      });
    } else {
      // Display the result dialog after finishing the quiz
      _showResultDialog();
    }
  }

  Future<void> _showResultDialog() async {
    String message;
    String? medalAsset;
    UserLevel currentUserLevel = UserLevel.none; // Default level

    // Fetch current user level from Firestore
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    String currentLevelString = userDoc['currentLevel'] ?? "none";

    // Convert string level to UserLevel enum
    currentUserLevel = UserLevel.values.firstWhere(
      (level) => level.displayName == currentLevelString,
      orElse: () => UserLevel.none, // Default to 'none' if not found
    );

    if (score == totalQuizzes) {
      // User finished with a perfect score
      message = '¡Felicidades! Has ganado una medalla:';

      // Update user badge in Firebase if the new level is higher
      if (currentUserLevel.index <
              (Difficulty.values.indexOf(selectedDifficulty!) + 1) &&
          currentUserLevel != UserLevel.advanced) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          "currentLevel": UserLevel.values[selectedDifficulty!.index + 1].name,
        });

        medalAsset = UserLevel.values[selectedDifficulty!.index + 1].asset;
      }
    } else {
      // User didn't get a perfect score
      message = 'Tu puntuación fue: $score. ¡Sigue intentándolo!';
    }

    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado de la práctica'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              if (medalAsset != null) // Show the medal asset if applicable
                Image.network(medalAsset),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ModulesScreen()), // Replace with your main screen widget
                  (Route<dynamic> route) =>
                      false, // Removes all previous routes
                ); // Redirect to main screen
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    if (selectedDifficulty == null) {
      // Show difficulty selection screen
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selecciona la dificultad de práctica',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => selectDifficulty(Difficulty.easy),
              child: const Text('Básico (10 preguntas)'),
            ),
            ElevatedButton(
              onPressed: () => selectDifficulty(Difficulty.medium),
              child: const Text('Medio (20 preguntas)'),
            ),
            ElevatedButton(
              onPressed: () => selectDifficulty(Difficulty.hard),
              child: const Text('Avanzado (30 preguntas)'),
            ),
          ],
        ),
      );
    }

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
            'Puntos: $score / $maxQuizzes',
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
