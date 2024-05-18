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
      body: Center(
        child: Text('This is my $title screen'),
      ),
    );
  }
}