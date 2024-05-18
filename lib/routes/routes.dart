import 'package:flutter/material.dart';
import 'package:myapp/screens/main_screen.dart';
import 'package:myapp/screens/learn_screen.dart';
import 'package:myapp/screens/practice_screen.dart';
import 'package:myapp/screens/dictionary_screen.dart';
import 'package:myapp/screens/find_screen.dart';

class AppRouting {
  static const initialRoute = modulesScreen;

  static const modulesScreen = 'modulesScreen';
  static const learnScreen = 'learnScreen';
  static const practiceScreen = 'practiceScreen';
  static const dictionaryScreen = 'dictionaryScreen';
  static const findScreen = 'findScreen';

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoute = {};

    appRoute.addAll({
      "modulesScreen": (BuildContext context) => const ModulesScreen()
    });

    appRoute.addAll({
      "learnScreen": (BuildContext context) => const LearnScreen(title: 'Aprender',)
    });

    appRoute.addAll({
      "practiceScreen": (BuildContext context) => const PracticeScreen(title: 'Practicar',)
    });

    appRoute.addAll({
      "dictionaryScreen": (BuildContext context) => DictionaryScreen(title: 'Diccionario',)
    });

    appRoute.addAll({
      "findScreen": (BuildContext context) => const FindScreen(title: 'Contacto',)
    });
    return appRoute;
  }
}
