import 'package:flutter/material.dart';
import 'package:ensenarte/components/card_component.dart';
import 'package:ensenarte/routes/routes.dart';
import 'package:ensenarte/utils/assets_routes.dart';
import 'package:ensenarte/utils/card_type.dart';
import 'package:ensenarte/models/learning_item.dart';

class LearnScreen extends StatelessWidget {
  final String title;
  const LearnScreen({super.key, required this.title});

  static List<CardComponent> availableLearningLessons = [
    CardComponent(
      title: 'Frases básicas',
      assetName: LearningModuleAsset.basicPhrases,
      routeName: AppRouting.learningItemsScreen,
      cardType: CardType.halfCard,
      learningItems: [
        LearningItem(
          BasicPhraseAsset.hello,
          'Hola',
          BasicPhraseAsset.hello,
        ),
        LearningItem(
          BasicPhraseAsset.goodMorning,
          '¡Buenos días!',
          BasicPhraseAsset.goodMorning,
        ),
        LearningItem(
          BasicPhraseAsset.goodNight,
          '¡Buenas noches!',
          BasicPhraseAsset.goodNight,
        ),
        LearningItem(
          BasicPhraseAsset.thankYou,
          '¡Gracias!',
          BasicPhraseAsset.thankYou,
        ),
        LearningItem(
          BasicPhraseAsset.please,
          'Por favor',
          BasicPhraseAsset.please,
        ),
        LearningItem(
          BasicPhraseAsset.loveYou,
          '¡Te quiero!',
          BasicPhraseAsset.loveYou,
        ),
        LearningItem(
          BasicPhraseAsset.iDontKnow,
          'No lo sé',
          BasicPhraseAsset.iDontKnow,
        ),
        LearningItem(
          BasicPhraseAsset.whatDoesItMean,
          '¿Qué significa?',
          BasicPhraseAsset.whatDoesItMean,
        ),
      ],
    ),
    CardComponent(
      title: 'Abecedario',
      assetName: LearningModuleAsset.alphabet,
      routeName: AppRouting.learningItemsScreen,
      cardType: CardType.halfCard,
      learningItems: [
        LearningItem(
          AlphabetAsset.letterA,
          'Letra A',
          AlphabetAsset.letterA,
        ),
        LearningItem(
          AlphabetAsset.letterB,
          'Letra B',
          AlphabetAsset.letterB,
        ),
        LearningItem(
          AlphabetAsset.letterC,
          'Letra C',
          AlphabetAsset.letterC,
        ),
        LearningItem(
          AlphabetAsset.letterD,
          'Letra D',
          AlphabetAsset.letterD,
        ),
        LearningItem(
          AlphabetAsset.letterE,
          'Letra E',
          AlphabetAsset.letterE,
        ),
        LearningItem(
          AlphabetAsset.letterF,
          'Letra F',
          AlphabetAsset.letterF,
        ),
        LearningItem(
          AlphabetAsset.letterG,
          'Letra G',
          AlphabetAsset.letterG,
        ),
        LearningItem(
          AlphabetAsset.letterH,
          'Letra H',
          AlphabetAsset.letterH,
        ),
        LearningItem(
          AlphabetAsset.letterI,
          'Letra I',
          AlphabetAsset.letterI,
        ),
        LearningItem(
          AlphabetAsset.letterJ,
          'Letra J',
          AlphabetAsset.letterJ,
        ),
        LearningItem(
          AlphabetAsset.letterK,
          'Letra K',
          AlphabetAsset.letterK,
        ),
        LearningItem(
          AlphabetAsset.letterL,
          'Letra L',
          AlphabetAsset.letterL,
        ),
        LearningItem(
          AlphabetAsset.letterM,
          'Letra M',
          AlphabetAsset.letterM,
        ),
        LearningItem(
          AlphabetAsset.letterN,
          'Letra N',
          AlphabetAsset.letterN,
        ),
        LearningItem(
          AlphabetAsset.letterO,
          'Letra O',
          AlphabetAsset.letterO,
        ),
        LearningItem(
          AlphabetAsset.letterP,
          'Letra P',
          AlphabetAsset.letterP,
        ),
        LearningItem(
          AlphabetAsset.letterQ,
          'Letra Q',
          AlphabetAsset.letterQ,
        ),
        LearningItem(
          AlphabetAsset.letterR,
          'Letra R',
          AlphabetAsset.letterR,
        ),
        LearningItem(
          AlphabetAsset.letterS,
          'Letra S',
          AlphabetAsset.letterS,
        ),
        LearningItem(
          AlphabetAsset.letterT,
          'Letra T',
          AlphabetAsset.letterT,
        ),
        LearningItem(
          AlphabetAsset.letterU,
          'Letra U',
          AlphabetAsset.letterU,
        ),
        LearningItem(AlphabetAsset.letterV, 'Letra V', AlphabetAsset.letterV),
        LearningItem(
          AlphabetAsset.letterW,
          'Letra W',
          AlphabetAsset.letterW,
        ),
        LearningItem(
          AlphabetAsset.letterX,
          'Letra X',
          AlphabetAsset.letterX,
        ),
        LearningItem(
          AlphabetAsset.letterY,
          'Letra Y',
          AlphabetAsset.letterY,
        ),
        LearningItem(
          AlphabetAsset.letterZ,
          'Letra Z',
          AlphabetAsset.letterZ,
        ),
      ],
    ),
    CardComponent(
      title: 'Números',
      assetName: LearningModuleAsset.numbers,
      routeName: AppRouting.learningItemsScreen,
      cardType: CardType.halfCard,
      learningItems: [
        LearningItem(
          AlphabetAsset.letterA,
          'Número 1',
          AlphabetAsset.letterA,
        )
      ],
    ),
    CardComponent(
      title: 'Familia',
      assetName: LearningModuleAsset.family,
      routeName: AppRouting.learningItemsScreen,
      cardType: CardType.halfCard,
      learningItems: [
        LearningItem(
          FamilyAsset.mom,
          'Mamá',
          FamilyAsset.mom,
        ),
        LearningItem(
          FamilyAsset.dad,
          'Papá',
          FamilyAsset.dad,
        ),
        LearningItem(
          FamilyAsset.son,
          'Hijo',
          FamilyAsset.son,
        ),
        LearningItem(
          FamilyAsset.daughter,
          'Hija',
          FamilyAsset.daughter,
        ),
        LearningItem(
          FamilyAsset.sibling,
          'Hermano/Hermana',
          FamilyAsset.sibling,
        ),
        LearningItem(
          FamilyAsset.grandMa,
          'Abuela',
          FamilyAsset.grandMa,
        ),
        LearningItem(
          FamilyAsset.grandPa,
          'Abuelo',
          FamilyAsset.grandPa,
        ),
      ],
    ),
    // CardComponent(
    //   title: 'Semana',
    //   assetName: LearningModuleAsset.week,
    //   routeName: AppRouting.learningItemsScreen,
    //   cardType: CardType.halfCard,
    //   learningItems: [
    //     LearningItem(AlphabetAsset.letterA, 'Lunes', AlphabetAsset.letterA,)
    //   ],
    // ),
  ];

  @override
  Widget build(BuildContext context) {
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
