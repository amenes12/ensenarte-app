import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  final String title; 
  const LearnScreen({super.key, required this.title});


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