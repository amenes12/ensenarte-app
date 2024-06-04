import 'package:ensenarte/components/button_component.dart';
import 'package:ensenarte/components/input_component.dart';
import 'package:ensenarte/routes/routes.dart';
import 'package:ensenarte/utils/show_snack_bar.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool agreeWithTermsAndConditions = false;

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

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 75.0),
            child: SizedBox(
              width: double.infinity,
              height: height * 0.15,
              child: Image.asset("assets/logo/logo-no-text.png"),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24.0),
            child: const Text(
              "Empieza a aprender",
              style: TextStyle(
                color: Color.fromRGBO(97, 137, 255, 1),
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Checkbox(
                  value: agreeWithTermsAndConditions,
                  onChanged: (newValue) {
                    setState(() {
                      agreeWithTermsAndConditions = newValue!;
                    });
                  },
                ),
                const Text(
                  "Acepto los términos y condiciones",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          ButtonComponent(
            onTap: agreeWithTermsAndConditions ? signUp : null,
            text: "Crear cuenta",
            color: agreeWithTermsAndConditions
                ? const Color.fromRGBO(97, 137, 255, 1)
                : const Color.fromARGB(255, 182, 202, 255),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, AppRouting.signInScreen);
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
    );
  }
}
