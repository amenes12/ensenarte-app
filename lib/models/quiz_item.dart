class QuizItem {
  String resourceToLoadRoute;
  String correctAnswer;
  List<String> options;
  List<String> optionsAssets;

  QuizItem(this.resourceToLoadRoute, this.correctAnswer, this.options, this.optionsAssets);
}
