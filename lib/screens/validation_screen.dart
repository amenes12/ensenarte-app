import 'package:ensenarte/widgets/validation_widget.dart';
import 'package:flutter/material.dart';

class ValidationScreen extends StatelessWidget {
  const ValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: ValidationWidget(title: 'validacion',)
        )
    );
  }
}
