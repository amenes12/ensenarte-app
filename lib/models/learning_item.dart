import 'package:ensenarte/routes/routes.dart';

enum Category { basicPhrases, alphabet, numbers, family, generalWords }

class LearningItem {
  String assetName;
  String title;
  String resourceToLoadRoute;
  String destinationRoute = AppRouting.resourceScreen;
  Category? category;
  bool isCameraSupported;

  LearningItem(
      this.assetName, this.title, this.resourceToLoadRoute, this.category, {this.isCameraSupported = false});
}
