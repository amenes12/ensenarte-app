import 'package:flutter/material.dart';

import '../components/menu_button_component.dart';

class FindScreen extends StatelessWidget {
  final String title; 
  const FindScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [
          MenuButtonComponent()
        ],
      ),
      body: Center(
        child: Text('This is my $title screen'),
      ),
    );
  }
}