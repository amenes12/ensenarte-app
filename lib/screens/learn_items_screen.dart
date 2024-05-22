import 'package:flutter/material.dart';
import 'package:myapp/components/list_component.dart';
import 'package:myapp/utils/list_element.dart';

class LearnItemsScreen extends StatelessWidget {

  const LearnItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String? title = arguments?['title'];
    final List<LearningItem>? availableLearningItems = arguments?['learningItems'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: ListComponent(elements: availableLearningItems!,)
      ),
    );
  }
}