import 'package:flutter/material.dart';
import 'package:ensenarte/components/list_component.dart';
import 'package:ensenarte/utils/assets_routes.dart';
import 'package:ensenarte/utils/list_element.dart';

class DictionaryScreen extends StatelessWidget {
  final String title;

  final List<LearningItem> availableDictionaryWords = [
    LearningItem(
      AlphabetAsset.letterA,
      'Letra A',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra B',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra C',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra D',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra E',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra F',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra G',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra H',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra I',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra J',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra K',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra L',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra M',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra N',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra O',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra P',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra Q',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra R',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra S',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra T',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra U',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra V',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra W',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra X',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra Y',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Letra Z',
      '',
    ),
  ];

  DictionaryScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListComponent(
          elements: availableDictionaryWords,
        ),
      ),
    );
  }
}
