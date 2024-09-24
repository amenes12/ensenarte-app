import 'dart:math';
import 'package:ensenarte/models/quiz_item.dart';
import 'package:ensenarte/models/learning_item.dart';

/// List to store the used LearningItems to avoid repetition
final Set<LearningItem> usedLearningItems = {};

QuizItem generateQuiz(
  List<LearningItem> availableLearningItems,
  int totalQuizzes,
) {
  final random = Random();

  // Step 1: Select a random correct item from any category
  LearningItem correctItem;

  do {
    correctItem =
        availableLearningItems[random.nextInt(availableLearningItems.length)];
  } while (usedLearningItems.contains(correctItem));

  // Mark this item as used to avoid repetition
  usedLearningItems.add(correctItem);

  // Step 2: Filter all items to only include the ones from the same category as the correct answer
  final categoryItems = availableLearningItems
      .where((item) => item.category == correctItem.category)
      .toList();

  final options = <String>[];
  final optionsAssets = <String>[];

  // Add the correct answer to the options
  options.add(correctItem.title);
  optionsAssets.add(correctItem.assetName);

  // Step 3: Add other incorrect options from the same category, ensuring uniqueness
  while (options.length < 3) {
    final randomItem = categoryItems[random.nextInt(categoryItems.length)];

    if (!options.contains(randomItem.title)) {
      options.add(randomItem.title);
      optionsAssets.add(randomItem.assetName);
    }
  }

  // Step 4: Shuffle the options and their corresponding assets
  final zippedOptions = List.generate(options.length,
      (index) => MapEntry(options[index], optionsAssets[index]));

  zippedOptions.shuffle(); // Shuffle the list

  final shuffledOptions = zippedOptions.map((entry) => entry.key).toList();
  final shuffledAssets = zippedOptions.map((entry) => entry.value).toList();

  // Step 5: Return the QuizItem with the shuffled options and assets
  return QuizItem(
    correctItem.resourceToLoadRoute, // Path to the resource (e.g., GIF)
    correctItem.title, // Correct answer
    shuffledOptions, // Shuffled options (titles)
    shuffledAssets, // Shuffled options (assets)
  );
}

void resetUsedLearningItems() {
  usedLearningItems.clear();
}
