import 'package:ensenarte/screens/main_screen.dart';
import 'package:ensenarte/screens/sign_in_screen.dart';
import 'package:ensenarte/utils/learning_item_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ensenarte/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LearningItemProvider.populateLearningItems();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'enSEÑArte',
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const ModulesScreen();
            } else {
              return const SignInScreen();
            }
          }),
      // initialRoute: AppRouting.modulesScreen,
      routes: AppRouting.getRoutes(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250),
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
          color: Color.fromRGBO(97, 137, 255, 1),
          elevation: 2,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        canvasColor: Colors.green,
        textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headlineMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            headlineSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            )),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(97, 137, 255, 1)),
        useMaterial3: true,
      ),
    );
  }
}
