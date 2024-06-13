import 'dart:math';
import 'package:ensenarte/models/quiz_item.dart';
import 'package:ensenarte/models/learning_item.dart';

QuizItem generateQuiz(List<LearningItem> availableLearningItems) {
  final random = Random();
  final correctItem =
      availableLearningItems[random.nextInt(availableLearningItems.length)];
  final options = <String>[];
  final optionsAssets = <String>[];

  options.add(correctItem.title);
  optionsAssets.add(correctItem.assetName);

  while (options.length < 3) {
    final randomItem =
        availableLearningItems[random.nextInt(availableLearningItems.length)];

    if (!options.contains(randomItem.title)) {
      options.add(randomItem.title);
      optionsAssets.add(randomItem.assetName);
    }
  }

  final zippedOptions = List.generate(options.length, (index) => MapEntry(options[index], optionsAssets[index]));
  final shuffledOptions = zippedOptions.map((entry) => entry.key).toList();
  final shuffledAssets = zippedOptions.map((entry) => entry.value).toList();

  return QuizItem(correctItem.resourceToLoadRoute, correctItem.title, shuffledOptions, shuffledAssets);
}
