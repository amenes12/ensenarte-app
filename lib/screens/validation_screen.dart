import 'package:ensenarte/widgets/validation_widget.dart';
import 'package:flutter/material.dart';

class ValidationScreen extends StatelessWidget {
  const ValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    String? targetLetter = arguments?['targetLetter'];

    return Scaffold(
      body: Center(
        child: ValidationWidget(
          title: 'Validación Letra ${targetLetter!}',
          targetLetter: targetLetter, // Letra específica que debe detectar
        ),
      ),
    );
  }
}
