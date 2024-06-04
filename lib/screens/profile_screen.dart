import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String title = "Perfil";
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String? username = FirebaseAuth.instance.currentUser?.displayName;
    final String? imageUrl = FirebaseAuth.instance.currentUser?.photoURL;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                clipBehavior: Clip.antiAlias,
                child: (imageUrl != null)
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                        width: 256.0,
                        height: 256.0,
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 128.0,
                        child: const Icon(
                          Icons.person,
                          color: Colors.black45,
                          size: 96.0,
                        ),
                      ),
              ),
              const Padding(padding: EdgeInsetsDirectional.only(top: 24)),
              Text(
                (username != null) ? "¡Hola, $username!" : "¡Hola, usuario!",
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
