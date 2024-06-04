import 'package:ensenarte/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:ensenarte/routes/routes.dart';
import 'package:ensenarte/utils/assets_routes.dart';
import 'package:ensenarte/utils/card_type.dart';

import '../components/card_component.dart';
import '../components/menu_button_component.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

  final String title = 'Menú';

  static const List<CardComponent> availableModules = [
    CardComponent(
      title: 'Aprender',
      routeName: AppRouting.learnScreen,
      assetName: BannerAsset.learn,
      cardType: CardType.fullCard,
    ),
    CardComponent(
        title: 'Practicar',
        routeName: AppRouting.practiceScreen,
        assetName: BannerAsset.practice,
        cardType: CardType.fullCard),
    CardComponent(
      title: 'Diccionario',
      routeName: AppRouting.dictionaryScreen,
      assetName: BannerAsset.dictionary,
      cardType: CardType.fullCard,
    ),
    CardComponent(
      title: 'Comunidades',
      routeName: AppRouting.communitiesScreen,
      assetName: BannerAsset.contact,
      cardType: CardType.fullCard,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        backgroundColor: const Color.fromRGBO(97, 137, 255, 1),
        actions: const [
          MenuButtonComponent(),
        ],
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(children: availableModules),
        ),
      ),
    );
  }
}
