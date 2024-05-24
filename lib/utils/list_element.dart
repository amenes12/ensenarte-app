import 'package:ensenarte/routes/routes.dart';

class LearningItem {
  String assetName;
  String title;
  String resourceToLoadRoute;
  String destinationRoute = AppRouting.resourceScreen;

  LearningItem(this.assetName, this.title, this.resourceToLoadRoute);
}
