import 'package:ensenarte/components/button_component.dart';
import 'package:ensenarte/components/input_component.dart';
import 'package:ensenarte/routes/routes.dart';
import 'package:ensenarte/services/auth_service.dart';
import 'package:ensenarte/utils/show_snack_bar.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void signIn() async {
    String result = await AuthService().signIn(
      email: emailController.text,
      password: passwordController.text,
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
              padding: const EdgeInsets.only(top: 75.0),
              child: SizedBox(
                width: double.infinity,
                height: height * 0.20,
                child: Image.asset("assets/logo/logo-no-text.png"),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(24.0),
                child: const Text(
                  "Ingresa a enSEÑArte",
                  style: TextStyle(
                    color:  Color.fromRGBO(97, 137, 255, 1),
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                )),
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
              onTap: signIn,
              text: "Ingresar",
              color: const Color.fromRGBO(97, 137, 255, 1),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, AppRouting.signUpScreen);
              },
              child: Container(
                  alignment: Alignment.center,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿No tienes una cuenta? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Regístrate",
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
