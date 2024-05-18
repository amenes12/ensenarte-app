import 'package:flutter/material.dart';
import 'package:myapp/routes/routes.dart';

import '../components/card_component.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

  final String title = 'Menú';

  static const List<CardComponent> availableModules = [
    CardComponent(title: 'Aprender', routeName: AppRouting.learnScreen, assetName: 'assets/images/banner-aprender.png',),
    CardComponent(title: 'Practicar', routeName: AppRouting.practiceScreen, assetName: 'assets/images/banner-aprender.png',),
    CardComponent(title: 'Diccionario', routeName: AppRouting.dictionaryScreen, assetName: 'assets/images/diccionario.png',),
    CardComponent(title: 'Contacto', routeName: AppRouting.findScreen, assetName: 'assets/images/contacto.png',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            children: availableModules
          ),
        ),
      ),
    );
  }
}