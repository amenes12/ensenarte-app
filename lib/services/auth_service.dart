import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    String result = "fail";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await firestore.collection("users").doc(credential.user!.uid).set({
          'username': username,
          'email': email,
          "uid": credential.user!.uid,
        });
      } else {
        result = "Ingresa correo, contraseña o usuario";
      }
      result = "success";
    } catch (e) {
      return e.toString();
    }
    return result;
  }

  Future<String> signIn(
      {required String email, required String password}) async {
    String result = "fail";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      } else {
        result = "Ingresa correo o contraseña";
      }
      result = "success";
    } catch (e) {
      return e.toString();
    }
    return result;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
