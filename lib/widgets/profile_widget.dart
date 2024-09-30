import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ensenarte/utils/get_medal.dart';
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
  UserLevel userLevel = UserLevel.none; // Use UserLevel enum
  int maxScore = 0;
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
          : FirebaseAuth.instance.currentUser?.displayName ?? "";
      photoURL = snapshot.data() != null
          ? snapshot["photoUrl"]
          : FirebaseAuth.instance.currentUser?.photoURL ?? "";

      String currentLevel =
          snapshot.data() != null ? snapshot["currentLevel"] : "none";
      userLevel = UserLevel.values.firstWhere(
        (level) => level.name == currentLevel,
        orElse: () => UserLevel.none,
      );

      maxScore = snapshot.data() != null ? snapshot["maxScore"] : 0;

      isLoading = false;
    });
  }

  void updateProfilePicture() async {
    try {
      // Pick image from gallery
      ImagePicker imagePicker = ImagePicker();
      XFile? uploadedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (uploadedImage != null) {
        setState(() {
          isLoading = true;
        });
        // Upload to Storage
        Reference ref = FirebaseStorage.instance
            .ref()
            .child("pictures/${FirebaseAuth.instance.currentUser!.uid}.png");

        await ref.putFile(File(uploadedImage.path)).whenComplete(() {
          showSnackBar(context, "¡Foto actualizada!");
        });

        String uploadedImageUrl = await ref.getDownloadURL();

        // Update photoUrl of current user
        await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          "photoUrl": uploadedImageUrl,
        });

        // Reload image of user profile
        getCurrentUser(); // Refresh user data without setState
      }
    } catch (e) {
      showSnackBar(context, "Cancelado");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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
                      child: (photoURL.isNotEmpty)
                          ? Image.network(
                              photoURL,
                              fit: BoxFit.cover,
                              width: height * 0.35,
                              height: height * 0.35,
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
                          color: Colors.black87,
                          size: 36.0,
                        ),
                      ),
                    )
                  ]),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(top: 24.0),
                  ),
                  Text(
                    "¡Hola, $username! 👋🏽",
                    style: TextStyle(
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tu puntaje máximo es: ",
                          style: TextStyle(
                            fontSize: height * 0.023,
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "$maxScore puntos 🏆",
                          style: TextStyle(
                            fontSize: height * 0.023,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 41, 164, 45),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Text(
                      "y tu nivel de práctica actual es: ",
                      style: TextStyle(
                        fontSize: height * 0.023,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: height * 0.3,
                    height: height * 0.3,
                    child: Material(
                      elevation: 4.0,
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(36.0),
                        bottomRight: Radius.circular(36.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.03),
                            child: Image.network(
                              userLevel.asset, // Use asset directly from enum
                              height: height * 0.18,
                              width: height * 0.18,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height * 0.02),
                            child: Text(
                              userLevel
                                  .displayName, // Get display name from enum
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: height * 0.03,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
