import 'dart:math';
import 'package:ensenarte/models/quiz_item.dart';
import 'package:ensenarte/models/learning_item.dart';

QuizItem generateQuiz(List<LearningItem> availableLearningItems) {
  final random = Random();
  final correctItem =
      availableLearningItems[random.nextInt(availableLearningItems.length)];
  final options = <String>[];

  options.add(correctItem.title);

  while (options.length < 3) {
    final randomItem =
        availableLearningItems[random.nextInt(availableLearningItems.length)];

    if (!options.contains(randomItem.title)) {
      options.add(randomItem.title);
    }
  }

  options.shuffle();

  return QuizItem(correctItem.resourceToLoadRoute, correctItem.title, options);
}
