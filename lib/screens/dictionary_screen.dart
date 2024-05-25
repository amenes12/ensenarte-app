import 'package:ensenarte/components/dictionary_search.dart';
import 'package:flutter/material.dart';
import 'package:ensenarte/utils/assets_routes.dart';
import 'package:ensenarte/utils/list_element.dart';

class DictionaryScreen extends StatelessWidget {
  final String title;

  List<LearningItem> availableDictionaryWords = [
    LearningItem(
      AlphabetAsset.letterA,
      'Abeja',
      AlphabetAsset.letterA,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Anillo',
      AlphabetAsset.letterA,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Avión',
      AlphabetAsset.letterA,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Bicicleta',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Burro',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Casa',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Carro',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Dados',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Duende',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Elefante',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Enano',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Familia',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Fuente',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Gato',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Girasol',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Huevo',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Imán',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Juegos',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Koala',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Limón',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Mesa',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Nuez',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Olla',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Pato',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Queso',
      '',
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Ratón',
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
        child: DictionarySearch(
          availableDictionaryWords: availableDictionaryWords,
        ),
      ),
    );
  }
}
