import 'package:ensenarte/components/dictionary_search.dart';
import 'package:flutter/material.dart';
import 'package:ensenarte/utils/assets_routes.dart';
import 'package:ensenarte/models/learning_item.dart';
import '../components/menu_button_component.dart';

class DictionaryScreen extends StatelessWidget {
  final String title;

  List<LearningItem> availableDictionaryWords = [
    LearningItem(
      AlphabetAsset.letterA,
      'Abeja',
      AlphabetAsset.letterA,
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Anillo',
      AlphabetAsset.letterA,
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Avión',
      AlphabetAsset.letterA,
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Bicicleta',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Burro',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Casa',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Carro',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Dados',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Duende',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Elefante',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Enano',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Familia',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Fuente',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Gato',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Girasol',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Huevo',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Imán',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Juegos',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Koala',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Limón',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Mesa',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Nuez',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Olla',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Pato',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Queso',
      '',
      Category.generalWords,
    ),
    LearningItem(
      AlphabetAsset.letterA,
      'Ratón',
      '',
      Category.generalWords,
    ),
  ];

  DictionaryScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [
          MenuButtonComponent(),
        ],
      ),
      body: Center(
        child: DictionarySearch(
          availableDictionaryWords: availableDictionaryWords,
        ),
      ),
    );
  }
}
