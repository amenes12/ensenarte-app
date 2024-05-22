import 'package:flutter/material.dart';
import 'package:myapp/components/list_component.dart';
import 'package:myapp/utils/list_element.dart';

class DictionaryScreen extends StatelessWidget {
  final String title; 

  final List<LearningItem> availableDictionaryWords = [
    LearningItem('assets/images/letra-a.png', 'Letra A', '',),
    LearningItem('assets/images/letra-a.png', 'Letra B', '',),
    LearningItem('assets/images/letra-a.png', 'Letra C', '',),
    LearningItem('assets/images/letra-a.png', 'Letra D', '',),
    LearningItem('assets/images/letra-a.png', 'Letra E', '',),
    LearningItem('assets/images/letra-a.png', 'Letra F', '',),
    LearningItem('assets/images/letra-a.png', 'Letra G', '',),
    LearningItem('assets/images/letra-a.png', 'Letra H', '',),
    LearningItem('assets/images/letra-a.png', 'Letra I', '',),
    LearningItem('assets/images/letra-a.png', 'Letra J', '',),
    LearningItem('assets/images/letra-a.png', 'Letra K', '',),
    LearningItem('assets/images/letra-a.png', 'Letra L', '',),
    LearningItem('assets/images/letra-a.png', 'Letra M', '',),
    LearningItem('assets/images/letra-a.png', 'Letra N', '',),
    LearningItem('assets/images/letra-a.png', 'Letra O', '',),
    LearningItem('assets/images/letra-a.png', 'Letra P', '',),
    LearningItem('assets/images/letra-a.png', 'Letra Q', '',),
    LearningItem('assets/images/letra-a.png', 'Letra R', '',),
    LearningItem('assets/images/letra-a.png', 'Letra S', '',),
    LearningItem('assets/images/letra-a.png', 'Letra T', '',),
    LearningItem('assets/images/letra-a.png', 'Letra U', '',),
    LearningItem('assets/images/letra-a.png', 'Letra V', '',),
    LearningItem('assets/images/letra-a.png', 'Letra W', '',),
    LearningItem('assets/images/letra-a.png', 'Letra X', '',),
    LearningItem('assets/images/letra-a.png', 'Letra Y', '',),
    LearningItem('assets/images/letra-a.png', 'Letra Z', '',),
  ];
  
  DictionaryScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListComponent(elements: availableDictionaryWords,),
      ),
    );
  }
}