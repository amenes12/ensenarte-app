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
    } else {
      answerStatus = AnswerStatus.incorrect;
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
    int currentMaxScore = userDoc['maxScore'] ?? 0;
    // Convert string level to UserLevel enum
    currentUserLevel = UserLevel.values.firstWhere(
      (level) => level.name == currentLevelString,
      orElse: () => UserLevel.none, // Default to 'none' if not found
    );

    if (score == totalQuizzes &&
        (selectedDifficulty!.index + 1) > currentUserLevel.index) {
      // User finished with a perfect score
      message = '¡Felicidades! Has ganado una medalla:';

      // Update user badge in Firebase if the new level is higher
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "currentLevel": UserLevel.values[selectedDifficulty!.index + 1].name,
      });

      medalAsset = UserLevel.values[selectedDifficulty!.index + 1].asset;

      if (currentMaxScore < score) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          "maxScore": score,
        });
      }
    } else {
      // User didn't get a perfect score
      message = 'Obtuviste $score puntos. ¡Sigue practicando! 💪🏻';

      if (currentMaxScore < score) {
        // Update max score if the new score is higher
        await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          "maxScore": score,
        });

        message = '¡Obtuviste un nuevo mejor puntaje: $score puntos! 📈';
      }
    }

    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Cómo te fue en la práctica? 🤓'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              if (medalAsset != null) // Show the medal asset if applicable
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Image.network(medalAsset),
                ),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Elige la dificultad de práctica 🎯',
              style: TextStyle(
                fontSize: height * 0.028,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.03),
            ElevatedButton(
              onPressed: () => selectDifficulty(Difficulty.easy),
              child: Padding(
                padding: EdgeInsets.all(height * 0.015),
                child: Text(
                  'Fácil (10 preguntas)',
                  style: TextStyle(fontSize: height * 0.022),
                ),
              ),
            ),
            SizedBox(height: height * 0.025),
            ElevatedButton(
              onPressed: () => selectDifficulty(Difficulty.medium),
              child: Padding(
                padding: EdgeInsets.all(height * 0.015),
                child: Text(
                  'Medio (20 preguntas)',
                  style: TextStyle(fontSize: height * 0.022),
                ),
              ),
            ),
            SizedBox(height: height * 0.025),
            ElevatedButton(
              onPressed: () => selectDifficulty(Difficulty.hard),
              child: Padding(
                padding: EdgeInsets.all(height * 0.015),
                child: Text(
                  'Difícil (30 preguntas)',
                  style: TextStyle(fontSize: height * 0.022),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        if (answerStatus != AnswerStatus.none)
          Padding(
            padding: EdgeInsets.all(height * 0.015),
            child: Icon(
              answerStatus == AnswerStatus.correct
                  ? Icons.check_circle
                  : Icons.cancel,
              color: answerStatus == AnswerStatus.correct
                  ? Colors.green
                  : Colors.red,
              size: height * 0.075,
            ),
          ),
        Padding(
          padding: EdgeInsets.all(height * 0.015),
          child: Text(
            'Puntos: $score / $maxQuizzes',
            style: TextStyle(
              fontSize: height * 0.028,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Padding(
            padding: EdgeInsets.all(height * 0.015),
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
              padding: EdgeInsets.symmetric(
                vertical: height * 0.01,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.025),
                        child: Image.network(
                          currentQuiz.optionsAssets[index],
                          height: height * 0.065,
                        ),
                      ),
                      SizedBox(width: width * 0.015),
                      Expanded(
                        child: Center(
                          child: Text(
                            currentQuiz.options[index],
                            style: TextStyle(
                              fontSize: height * 0.028,
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
