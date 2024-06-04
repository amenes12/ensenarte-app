import 'package:ensenarte/widgets/communities_widget.dart';
import 'package:flutter/material.dart';
import '../components/menu_button_component.dart';

class CommunitiesScreen extends StatelessWidget {
  final String title = "Comunidades";
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [
          MenuButtonComponent(),
        ],
      ),
      body: const CommunitiesWidget(),
    );
  }
}
