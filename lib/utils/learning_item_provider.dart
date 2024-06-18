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
        BasicPhraseVideo.hello,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.goodMorning,
        '¡Buenos días!',
        BasicPhraseVideo.goodMorning,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.goodNight,
        '¡Buenas noches!',
        BasicPhraseVideo.goodNight,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.thankYou,
        '¡Gracias!',
        BasicPhraseVideo.thankYou,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.please,
        'Por favor',
        BasicPhraseVideo.please,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.loveYou,
        '¡Te quiero!',
        BasicPhraseVideo.loveYou,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.iDontKnow,
        'No lo sé',
        BasicPhraseVideo.iDontKnow,
        Category.basicPhrases,
      ),
      LearningItem(
        BasicPhraseAsset.whatDoesItMean,
        '¿Qué significa?',
        BasicPhraseVideo.whatDoesItMean,
        Category.basicPhrases,
      ),
    ]);

    learningItemsByCategory[Category.alphabet]!.addAll(
      [
        LearningItem(
          AlphabetAsset.letterA,
          'Letra A',
          AlphabetVideo.letterA,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterB,
          'Letra B',
          AlphabetVideo.letterB,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterC,
          'Letra C',
          AlphabetVideo.letterC,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterD,
          'Letra D',
          AlphabetVideo.letterD,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterE,
          'Letra E',
          AlphabetVideo.letterE,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterF,
          'Letra F',
          AlphabetVideo.letterF,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterG,
          'Letra G',
          AlphabetVideo.letterG,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterH,
          'Letra H',
          AlphabetVideo.letterH,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterI,
          'Letra I',
          AlphabetVideo.letterI,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterJ,
          'Letra J',
          AlphabetVideo.letterJ,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterK,
          'Letra K',
          AlphabetVideo.letterK,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterL,
          'Letra L',
          AlphabetVideo.letterL,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterM,
          'Letra M',
          AlphabetVideo.letterM,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterN,
          'Letra N',
          AlphabetVideo.letterN,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterO,
          'Letra O',
          AlphabetVideo.letterO,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterP,
          'Letra P',
          AlphabetVideo.letterP,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterQ,
          'Letra Q',
          AlphabetVideo.letterQ,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterR,
          'Letra R',
          AlphabetVideo.letterR,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterS,
          'Letra S',
          AlphabetVideo.letterS,
          Category.alphabet,
        ),
        LearningItem(
          AlphabetAsset.letterT,
          'Letra T',
          AlphabetVideo.letterT,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterU,
          'Letra U',
          AlphabetVideo.letterU,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterV,
          'Letra V',
          AlphabetVideo.letterV,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterW,
          'Letra W',
          AlphabetVideo.letterW,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterX,
          'Letra X',
          AlphabetVideo.letterX,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterY,
          'Letra Y',
          AlphabetVideo.letterY,
          Category.alphabet,
          isCameraSupported: true,
        ),
        LearningItem(
          AlphabetAsset.letterZ,
          'Letra Z',
          AlphabetVideo.letterZ,
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
        NumberVideo.numberTwo,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberThree,
        'Número tres',
        NumberVideo.numberThree,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberFour,
        'Número cuatro',
        NumberVideo.numberFour,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberFive,
        'Número cinco',
        NumberVideo.numberFive,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberSix,
        'Número seis',
        NumberVideo.numberSix,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberSeven,
        'Número siete',
        NumberVideo.numberSeven,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberEight,
        'Número ocho',
        NumberVideo.numberEight,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberNine,
        'Número nueve',
        NumberVideo.numberNine,
        Category.numbers,
      ),
      LearningItem(
        NumberAsset.numberTen,
        'Número diez',
        NumberVideo.numberTen,
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
        LearningItem(
          FamilyAsset.mom,
          'Mamá',
          FamilyVideo.mom,
          Category.family,
        ),
        LearningItem(
          FamilyAsset.dad,
          'Papá',
          FamilyVideo.dad,
          Category.family,
        ),
        LearningItem(
          FamilyAsset.son,
          'Hijo',
          FamilyVideo.son,
          Category.family,
        ),
        LearningItem(
          FamilyAsset.daughter,
          'Hija',
          FamilyVideo.daughter,
          Category.family,
        ),
        LearningItem(
          FamilyAsset.brother,
          'Hermano',
          FamilyVideo.brother,
          Category.family,
        ),
        LearningItem(
          FamilyAsset.sister,
          'Hermana',
          FamilyVideo.sister,
          Category.family,
        ),
        LearningItem(
          FamilyAsset.grandMa,
          'Abuela',
          FamilyVideo.grandMa,
          Category.family,
        ),
        LearningItem(
          FamilyAsset.grandPa,
          'Abuelo',
          FamilyVideo.grandPa,
          Category.family,
        ),
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
