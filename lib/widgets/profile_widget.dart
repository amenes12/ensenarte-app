import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  String username = "";
  String photoURL = "";

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
  
    setState(() {
      username = snapshot["username"] ?? FirebaseAuth.instance.currentUser?.displayName;
      photoURL = snapshot["photoUrl"] ?? FirebaseAuth.instance.currentUser?.photoURL;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                clipBehavior: Clip.antiAlias,
                child: (photoURL != "")
                    ? Image.network(
                        photoURL,
                        fit: BoxFit.cover,
                        width: 228.0,
                        height: 228.0,
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
              const Padding(padding: EdgeInsetsDirectional.only(top: 24.0)),
              Text(
                "¡Hola, $username!",
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
  }
}