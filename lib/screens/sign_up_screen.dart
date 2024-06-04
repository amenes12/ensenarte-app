import 'package:flutter/material.dart';
import '../widgets/sign_up_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpWidget(),
    );
  }
}
