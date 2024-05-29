import 'package:ensenarte/components/button_component.dart';
import 'package:ensenarte/components/input_component.dart';
import 'package:ensenarte/routes/routes.dart';
import 'package:ensenarte/utils/show_snack_bar.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void signUp() async {
    String result = await AuthService().signUp(
      email: emailController.text,
      password: passwordController.text,
      username: usernameController.text,
    );

    if (result == "success") {
      setState(() {
        isLoading = true;
      });

      Navigator.pushReplacementNamed(context, AppRouting.modulesScreen);

      showSnackBar(context, "¡Bienvenido!");
    } else {
      setState(() {
        isLoading = false;
      });

      showSnackBar(context, result);
    }
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: SizedBox(
                width: double.infinity,
                height: height * 0.20,
                child: Image.asset("assets/logo/logo.png"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              child: const Text(
                "Regístrate",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            InputComponent(
              controller: usernameController,
              hintText: "Usuario",
              icon: Icons.person,
            ),
            InputComponent(
              controller: emailController,
              hintText: "Correo",
              icon: Icons.email,
            ),
            InputComponent(
              controller: passwordController,
              hintText: "Contraseña",
              icon: Icons.lock,
              isPassword: true,
            ),
            ButtonComponent(
              onTap: signUp,
              text: "Crear cuenta",
              color: const Color.fromRGBO(97, 137, 255, 1),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AppRouting.signInScreen);
              },
              child: Container(
                  alignment: Alignment.center,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Ya tienes una cuenta?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        " Inicia sesión",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
