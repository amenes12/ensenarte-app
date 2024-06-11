import 'package:ensenarte/widgets/dictionary_widget.dart';
import 'package:flutter/material.dart';
import 'package:ensenarte/utils/assets_routes.dart';
import 'package:ensenarte/models/learning_item.dart';
import '../components/menu_button_component.dart';

class DictionaryScreen extends StatelessWidget {
  final String title;

  List<LearningItem> availableDictionaryWords = [
    LearningItem(
      DictionaryWordAsset.abeja,
      'Abeja',
      DictionaryWordAsset.abeja,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.anillo,
      'Anillo',
      DictionaryWordAsset.anillo,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.avion,
      'Avión',
      DictionaryWordAsset.avion,      
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.bicicleta,
      'Bicicleta',
      DictionaryWordAsset.bicicleta,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.burro,
      'Burro',
      DictionaryWordAsset.burro,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.casa,
      'Casa',
      DictionaryWordAsset.casa,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.carro,
      'Carro',
      DictionaryWordAsset.carro,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.dados,
      'Dados',
      DictionaryWordAsset.dados,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.duende,
      'Duende',
      DictionaryWordAsset.duende,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.elefante,
      'Elefante',
      DictionaryWordAsset.elefante,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.erizo,
      'Erizo',
      DictionaryWordAsset.erizo,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.fiesta,
      'Fiesta',
      DictionaryWordAsset.fiesta,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.fuente,
      'Fuente',
      DictionaryWordAsset.fuente,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.gato,
      'Gato',
      DictionaryWordAsset.gato,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.girasol,
      'Girasol',
      DictionaryWordAsset.girasol,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.huevo,
      'Huevo',
      DictionaryWordAsset.huevo,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.iman,
      'Imán',
      DictionaryWordAsset.iman,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.jabon,
      'Jabón',
      DictionaryWordAsset.jabon,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.koala,
      'Koala',
      DictionaryWordAsset.koala,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.limon,
      'Limón',
      DictionaryWordAsset.limon,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.mesa,
      'Mesa',
      DictionaryWordAsset.mesa,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.nuez,
      'Nuez',
      DictionaryWordAsset.nuez,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.olla,
      'Olla',
      DictionaryWordAsset.olla,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.pato,
      'Pato',
      DictionaryWordAsset.pato,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.queso,
      'Queso',
      DictionaryWordAsset.queso,
      Category.generalWords,
    ),
    LearningItem(
      DictionaryWordAsset.raton,
      'Ratón',
      DictionaryWordAsset.raton,
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
        child: DictionaryWidget(
          availableDictionaryWords: availableDictionaryWords,
        ),
      ),
    );
  }
}
