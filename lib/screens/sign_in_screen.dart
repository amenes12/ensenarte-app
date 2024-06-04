import 'package:ensenarte/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInWidget(),
    );
  }
}
