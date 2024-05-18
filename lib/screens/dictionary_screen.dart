import 'package:flutter/material.dart';

class DictionaryScreen extends StatelessWidget {
  final String title; 
  const DictionaryScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('This is my $title screen'),
      ),
    );
  }
}