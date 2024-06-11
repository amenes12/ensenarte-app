import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ensenarte/utils/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  String username = "";
  String photoURL = "";
  bool isLoading = true;
  Uint8List? newSelectedImage;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = snapshot.data() != null
          ? snapshot["username"]
          : FirebaseAuth.instance.currentUser?.displayName;
      photoURL = snapshot.data() != null
          ? snapshot["photoUrl"]
          : FirebaseAuth.instance.currentUser?.photoURL;

      isLoading = false;
    });
  }

  void updateProfilePicture() async {
    try {
    // Pick image from gallery
      ImagePicker imagePicker = ImagePicker();
      XFile? uploadedImage = await imagePicker.pickImage(source: ImageSource.gallery);

      if (uploadedImage != null) {
        // Upload to Storage
        Reference ref = FirebaseStorage.instance.ref().child("pictures/${FirebaseAuth.instance.currentUser!.uid}.png");

        await ref.putFile(File(uploadedImage.path)).whenComplete(() {
          showSnackBar(context, "¡Foto actualizada!");
        });

        String uploadedImageUrl = await ref.getDownloadURL();

        // Update photoUrl of current user

        await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
          "photoUrl": uploadedImageUrl,
        });

        // Reload image of user profile
        setState(() {
          photoURL = uploadedImageUrl;
        });
        // https://www.youtube.com/watch?v=Ttp9gpcFeNU
        // Be happy
      }
    } catch (e) {
      showSnackBar(context, "Cancelado");
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
        child: (isLoading)
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(children: [
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
                    Positioned(
                      bottom: -0.5,
                      right: -0.5,
                      child: IconButton(
                        onPressed: updateProfilePicture,
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.black,
                          size: 36.0,
                        ),
                      ),
                    )
                  ]),
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
