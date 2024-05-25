import 'package:ensenarte/components/quiz_component.dart';
import 'package:flutter/material.dart';

class PracticeScreen extends StatelessWidget {
  final String title;
  const PracticeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const QuizComponent(),
    );
  }
}
