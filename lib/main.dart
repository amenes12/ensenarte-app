import 'package:flutter/material.dart';
import 'package:myapp/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'enSEÑArte',
      initialRoute: AppRouting.modulesScreen,
      routes: AppRouting.getRoutes(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(97, 137, 255, 1),
          elevation: 2,
        ),
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
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(97, 137, 255, 1)),
        useMaterial3: true,
      ),
    );
  }
}

