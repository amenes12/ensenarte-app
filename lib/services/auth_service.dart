import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  final googleSignIn = GoogleSignIn();

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

        result = "success";
      } else {
        result = "Ingresa correo, contraseña o usuario";
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          result = "Correo ya utilizado";
          break;
        case "invalid-email":
          result = "Correo no válido";
          break;
        case "weak-password":
          result = "Prueba una contraseña más fuerte";
          break;
        case "operation-not-allowed":
          result = "Operación prohibida";
          break;
        default:
          result = e.message.toString();
          break;
      }
    }
    return result;
  }

  Future<String> signIn(
      {required String email, required String password}) async {
    String result = "fail";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        result = "success";
      } else {
        result = "Ingresa correo o contraseña";
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          result = "¡El correo no es válido!";
          break;
        case "user-disabled":
          result = "Usuario deshabilitado";
          break;
        case "user-not-found":
          result = "No existe el usuario";
          break;
        case "wrong-password":
          result = "Contraseña incorrecta";
          break;
        default:
          result = e.message.toString();
          break;
      }
    }
    return result;
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        await auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<void> signOut() async {
    if (googleSignIn.currentUser != null) {
      await googleSignIn.disconnect();
      await auth.signOut();
    } else {
      await auth.signOut();
    }
  }
}
