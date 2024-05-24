import 'package:flutter/material.dart';
import 'package:ensenarte/components/list_component.dart';
import 'package:ensenarte/utils/list_element.dart';

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
      ),
      body: Center(
          child: ListComponent(
        elements: availableLearningItems!,
      )),
    );
  }
}
