import 'package:ensenarte/models/learning_category.dart';
import 'package:ensenarte/utils/learning_item_provider.dart';
import 'package:flutter/material.dart';
import 'package:ensenarte/components/card_component.dart';
import 'package:ensenarte/routes/routes.dart';
import 'package:ensenarte/utils/assets_routes.dart';
import 'package:ensenarte/utils/card_type.dart';
import 'package:ensenarte/models/learning_item.dart';

class LearnScreen extends StatelessWidget {
  final String title;
  final List<LearningCategory> categories = [
    LearningCategory(
      'Frases básicas',
      LearningModuleAsset.basicPhrases,
      Category.basicPhrases,
    ),
    LearningCategory(
      'Abecedario',
      LearningModuleAsset.alphabet,
      Category.alphabet,
    ),
    LearningCategory(
      'Números',
      LearningModuleAsset.numbers,
      Category.numbers,
    ),
    LearningCategory(
      'Familia',
      LearningModuleAsset.family,
      Category.family,
    ),
    // Add more categories if needed...
  ];

  LearnScreen({super.key, required this.title});

  List<CardComponent> generateLearningLessons() {
    return categories.map((categoryItem) {
      return CardComponent(
        title: categoryItem.title,
        assetName: categoryItem.assetName,
        routeName: AppRouting.learningItemsScreen,
        cardType: CardType.halfCard,
        learningItems: LearningItemProvider.getLearningItemsByCategory(
            categoryItem.category),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final availableLearningLessons = generateLearningLessons();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: availableLearningLessons,
        ),
      ),
    );
  }
}
