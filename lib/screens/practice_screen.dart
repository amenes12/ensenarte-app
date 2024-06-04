import 'package:ensenarte/widgets/quiz_widget.dart';
import 'package:flutter/material.dart';

import '../components/menu_button_component.dart';

class PracticeScreen extends StatelessWidget {
  final String title;
  const PracticeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [
          MenuButtonComponent(),
        ],
      ),
      body: const QuizWidget(),
    );
  }
}
