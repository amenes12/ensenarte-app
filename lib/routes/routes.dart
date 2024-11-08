import 'package:ensenarte/screens/communities_screen.dart';
import 'package:ensenarte/screens/profile_screen.dart';
import 'package:ensenarte/screens/sign_in_screen.dart';
import 'package:ensenarte/screens/validation_screen.dart';
import 'package:flutter/material.dart';
import 'package:ensenarte/screens/learn_items_screen.dart';
import 'package:ensenarte/screens/main_screen.dart';
import 'package:ensenarte/screens/learn_screen.dart';
import 'package:ensenarte/screens/practice_screen.dart';
import 'package:ensenarte/screens/dictionary_screen.dart';
import 'package:ensenarte/screens/resource_screen.dart';

import '../screens/sign_up_screen.dart';

class AppRouting {
  static const initialRoute = modulesScreen;

  static const signUpScreen = 'signUpScreen';
  static const signInScreen = 'signInScreen';
  static const modulesScreen = 'modulesScreen';
  static const learnScreen = 'learnScreen';
  static const practiceScreen = 'practiceScreen';
  static const dictionaryScreen = 'dictionaryScreen';
  static const communitiesScreen = 'communitiesScreen';
  static const resourceScreen = 'resourceScreen';
  static const learningItemsScreen = 'learningItemsScreen';
  static const profileScreen = 'profileScreen';
  static const validationScreen = 'validationScreen';

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoute = {};

    appRoute.addAll({
      "signUpScreen": (BuildContext context) => const SignUpScreen(),
    });
    appRoute.addAll({
      "signInScreen": (BuildContext context) => const SignInScreen(),
    });
    appRoute.addAll({
      "modulesScreen": (BuildContext context) => const ModulesScreen(),
    });

    appRoute.addAll({
      "learnScreen": (BuildContext context) => LearnScreen(
            title: 'Aprender',
          )
    });

    appRoute.addAll({
      "practiceScreen": (BuildContext context) => const PracticeScreen(
            title: 'Practicar',
          )
    });

    appRoute.addAll({
      "dictionaryScreen": (BuildContext context) => DictionaryScreen(
            title: 'Diccionario',
          )
    });

    appRoute.addAll({
      "communitiesScreen": (BuildContext context) => const CommunitiesScreen()
    });

    appRoute.addAll(
        {"resourceScreen": (BuildContext context) => const ResourceScreen()});

    appRoute.addAll(
        {"learningItemsScreen": (BuildContext context) => LearnItemsScreen()});

    appRoute.addAll(
        {"profileScreen": (BuildContext context) => const ProfileScreen()});

    appRoute.addAll({
      "validationScreen": (BuildContext context) => const ValidationScreen()
    });

    return appRoute;
  }
}
