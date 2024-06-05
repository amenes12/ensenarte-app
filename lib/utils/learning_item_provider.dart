import 'package:ensenarte/models/learning_item.dart';
import 'package:ensenarte/utils/assets_routes.dart';

class LearningItemProvider {
  static final Map<Category, List<LearningItem>> learningItemsByCategory = {
    Category.basicPhrases: [],
    Category.alphabet: [],
    Category.numbers: [],
    Category.family: [],
  };

  static void populateLearningItems() {
    learningItemsByCategory[Category.basicPhrases]!.addAll([
      LearningItem(
        BasicPhraseAsset.hello,
        'Hola',
        BasicPhraseAsset.hello,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.goodMorning,
        '¡Buenos días!',
        BasicPhraseAsset.goodMorning,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.goodNight,
        '¡Buenas noches!',
        BasicPhraseAsset.goodNight,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.thankYou,
        '¡Gracias!',
        BasicPhraseAsset.thankYou,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.please,
        'Por favor',
        BasicPhraseAsset.please,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.loveYou,
        '¡Te quiero!',
        BasicPhraseAsset.loveYou,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.iDontKnow,
        'No lo sé',
        BasicPhraseAsset.iDontKnow,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.whatDoesItMean,
        '¿Qué significa?',
        BasicPhraseAsset.whatDoesItMean,
        Category.basicPhrases,
      ),
    ]);

    learningItemsByCategory[Category.alphabet]!.addAll(
      [
        LearningItem(
          AlphabetAsset.letterA,
          'Letra A',
          AlphabetAsset.letterA,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterB,
          'Letra B',
          AlphabetAsset.letterB,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterC,
          'Letra C',
          AlphabetAsset.letterC,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterD,
          'Letra D',
          AlphabetAsset.letterD,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterE,
          'Letra E',
          AlphabetAsset.letterE,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterF,
          'Letra F',
          AlphabetAsset.letterF,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterG,
          'Letra G',
          AlphabetAsset.letterG,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterH,
          'Letra H',
          AlphabetAsset.letterH,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterI,
          'Letra I',
          AlphabetAsset.letterI,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterJ,
          'Letra J',
          AlphabetAsset.letterJ,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterK,
          'Letra K',
          AlphabetAsset.letterK,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterL,
          'Letra L',
          AlphabetAsset.letterL,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterM,
          'Letra M',
          AlphabetAsset.letterM,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterN,
          'Letra N',
          AlphabetAsset.letterN,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterO,
          'Letra O',
          AlphabetAsset.letterO,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterP,
          'Letra P',
          AlphabetAsset.letterP,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterQ,
          'Letra Q',
          AlphabetAsset.letterQ,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterR,
          'Letra R',
          AlphabetAsset.letterR,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterS,
          'Letra S',
          AlphabetAsset.letterS,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterT,
          'Letra T',
          AlphabetAsset.letterT,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterU,
          'Letra U',
          AlphabetAsset.letterU,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterV,
          'Letra V',
          AlphabetAsset.letterV,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterW,
          'Letra W',
          AlphabetAsset.letterW,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterX,
          'Letra X',
          AlphabetAsset.letterX,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterY,
          'Letra Y',
          AlphabetAsset.letterY,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterZ,
          'Letra Z',
          AlphabetAsset.letterZ,
          Category.alphabet,
        ),
      ],
    );

    learningItemsByCategory[Category.numbers]!.addAll([
      LearningItem(
        NumberAsset.numberOne,
        'Número uno',
        NumberVideo.numberOne,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberTwo,
        'Número dos',
        NumberAsset.numberTwo,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberThree,
        'Número tres',
        NumberAsset.numberThree,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberFour,
        'Número cuatro',
        NumberAsset.numberFour,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberFive,
        'Número cinco',
        NumberAsset.numberFive,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberSix,
        'Número seis',
        NumberAsset.numberSix,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberSeven,
        'Número siete',
        NumberAsset.numberSeven,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberEight,
        'Número ocho',
        NumberAsset.numberEight,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberNine,
        'Número nueve',
        NumberAsset.numberNine,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberTen,
        'Número diez',
        NumberAsset.numberTen,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberEleven,
        'Número once',
        NumberAsset.numberEleven,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberTwelve,
        'Número doce',
        NumberAsset.numberTwelve,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberThirteen,
        'Número trece',
        NumberAsset.numberThirteen,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberFourteen,
        'Número catorce',
        NumberAsset.numberFourteen,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberFifteen,
        'Número quince',
        NumberAsset.numberFifteen,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberSixteen,
        'Número dieciséis',
        NumberAsset.numberSixteen,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberSeventeen,
        'Número diecisiete',
        NumberAsset.numberSeventeen,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberEighteen,
        'Número dieciocho',
        NumberAsset.numberEighteen,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberNineteen,
        'Número diecinueve',
        NumberAsset.numberNineteen,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberTwenty,
        'Número veinte',
        NumberAsset.numberTwenty,
        Category.numbers,
      ),
    ]);

    learningItemsByCategory[Category.family]!.addAll(
      [
        LearningItem(FamilyAsset.mom, 'Mamá', FamilyAsset.mom, Category.family),
        LearningItem(FamilyAsset.dad, 'Papá', FamilyAsset.dad, Category.family),
        LearningItem(FamilyAsset.son, 'Hijo', FamilyAsset.son, Category.family),
        LearningItem(FamilyAsset.daughter, 'Hija', FamilyAsset.daughter,
            Category.family),
        LearningItem(FamilyAsset.sibling, 'Hermano/Hermana',
            FamilyAsset.sibling, Category.family),
        LearningItem(FamilyAsset.grandMa, 'Abuela', FamilyAsset.grandMa,
            Category.family),
        LearningItem(FamilyAsset.grandPa, 'Abuelo', FamilyAsset.grandPa,
            Category.family),
      ],
    );
  }

  static List<LearningItem> getLearningItemsByCategory(Category category) {
    return learningItemsByCategory[category]!;
  }

  static List<LearningItem> getAllLearningItems() {
    return learningItemsByCategory.values.expand((list) => list).toList();
  }
}
