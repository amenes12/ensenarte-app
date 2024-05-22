import 'package:flutter/material.dart';
import 'package:myapp/components/card_component.dart';
import 'package:myapp/routes/routes.dart';
import 'package:myapp/utils/card_type.dart';
import 'package:myapp/utils/list_element.dart';

class LearnScreen extends StatelessWidget {
  final String title;
  const LearnScreen({super.key, required this.title});

  static List<CardComponent> availableLearningLessons = [
    CardComponent(
      title: 'Frases básicas',
      assetName: 'assets/images/frases-basicas.png',
      routeName: AppRouting.learningItemsScreen,
      cardType: CardType.halfCard,
      learningItems: [
        LearningItem('assets/images/letra-a.png', 'Hola', 'assets/images/letra-a.png')
      ],
    ),
    CardComponent(
      title: 'Abecedario',
      assetName: 'assets/images/abecedario.png',
      routeName: AppRouting.learningItemsScreen,
      cardType: CardType.halfCard,
      learningItems: [
        LearningItem('assets/images/letra-a.png', 'Letra A', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra B', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra C', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra D', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra E', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra F', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra G', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra H', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra I', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra J', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra K', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra L', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra M', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra N', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra O', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra P', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra Q', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra R', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra S', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra T', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra U', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra V', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra W', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra X', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra Y', 'assets/images/letra-a.png',),
        LearningItem('assets/images/letra-a.png', 'Letra Z', 'assets/images/letra-a.png',),
      ],
    ),
    CardComponent(
      title: 'Números',
      assetName: 'assets/images/numeros.png',
      routeName: AppRouting.learningItemsScreen,
      cardType: CardType.halfCard,
      learningItems: [
        LearningItem('assets/images/letra-a.png', 'Número 1', 'assets/images/letra-a.png',)
      ],
    ),
    CardComponent(
      title: 'Familia',
      assetName: 'assets/images/familia.png',
      routeName: AppRouting.learningItemsScreen,
      cardType: CardType.halfCard,
      learningItems: [
        LearningItem('assets/images/letra-a.png', 'Mamá', 'assets/images/letra-a.png',)
      ],
    ),
    CardComponent(
      title: 'Semana',
      assetName: 'assets/images/semana.png',
      routeName: AppRouting.learningItemsScreen,
      cardType: CardType.halfCard,
      learningItems: [
        LearningItem('assets/images/letra-a.png', 'Lunes', 'assets/images/letra-a.png',)
      ],
    ),
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
