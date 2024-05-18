import 'package:flutter/material.dart';

class FindScreen extends StatelessWidget {
  final String title; 
  const FindScreen({super.key, required this.title});

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