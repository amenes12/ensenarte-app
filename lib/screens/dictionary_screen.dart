import 'package:flutter/material.dart';
import 'package:myapp/components/list_component.dart';
import 'package:myapp/utils/assets_routes.dart';
import 'package:myapp/utils/list_element.dart';

class DictionaryScreen extends StatelessWidget {
  final String title; 

  final List<LearningItem> availableDictionaryWords = [
    LearningItem(AlphabetAssets.letterA, 'Letra A', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra B', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra C', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra D', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra E', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra F', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra G', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra H', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra I', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra J', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra K', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra L', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra M', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra N', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra O', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra P', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra Q', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra R', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra S', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra T', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra U', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra V', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra W', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra X', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra Y', '',),
    LearningItem(AlphabetAssets.letterA, 'Letra Z', '',),
  ];
  
  DictionaryScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListComponent(elements: availableDictionaryWords,),
      ),
    );
  }
}