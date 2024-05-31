import 'package:flutter/material.dart';
import 'package:ensenarte/components/list_component.dart';
import 'package:ensenarte/models/learning_item.dart';

import '../components/menu_button_component.dart';

class LearnItemsScreen extends StatelessWidget {
  String? title;
  List<LearningItem>? availableLearningItems;

  LearnItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    title = arguments?['title'];
    availableLearningItems = arguments?['learningItems'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        actions: const [
          MenuButtonComponent()
        ],
      ),
      body: Center(
          child: ListComponent(
        elements: availableLearningItems!,
      )),
    );
  }
}
