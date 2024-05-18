import 'package:flutter/material.dart';
import 'package:myapp/components/list_component.dart';
import 'package:myapp/utils/list_element.dart';

class DictionaryScreen extends StatelessWidget {
  final String title; 

  final List<ListElement> availableDictionaryWords = [
    ListElement('assets/images/letra-a.png', 'Letra A'),
    ListElement('assets/images/letra-a.png', 'Letra B'),
    ListElement('assets/images/letra-a.png', 'Letra C'),
    ListElement('assets/images/letra-a.png', 'Letra D'),
    ListElement('assets/images/letra-a.png', 'Letra E'),
    ListElement('assets/images/letra-a.png', 'Letra F'),
    ListElement('assets/images/letra-a.png', 'Letra G'),
    ListElement('assets/images/letra-a.png', 'Letra H'),
    ListElement('assets/images/letra-a.png', 'Letra I'),
    ListElement('assets/images/letra-a.png', 'Letra J'),
    ListElement('assets/images/letra-a.png', 'Letra K'),
    ListElement('assets/images/letra-a.png', 'Letra L'),
    ListElement('assets/images/letra-a.png', 'Letra M'),
    ListElement('assets/images/letra-a.png', 'Letra N'),
    ListElement('assets/images/letra-a.png', 'Letra O'),
    ListElement('assets/images/letra-a.png', 'Letra P'),
    ListElement('assets/images/letra-a.png', 'Letra Q'),
    ListElement('assets/images/letra-a.png', 'Letra R'),
    ListElement('assets/images/letra-a.png', 'Letra S'),
    ListElement('assets/images/letra-a.png', 'Letra T'),
    ListElement('assets/images/letra-a.png', 'Letra U'),
    ListElement('assets/images/letra-a.png', 'Letra V'),
    ListElement('assets/images/letra-a.png', 'Letra W'),
    ListElement('assets/images/letra-a.png', 'Letra X'),
    ListElement('assets/images/letra-a.png', 'Letra Y'),
    ListElement('assets/images/letra-a.png', 'Letra Z'),
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