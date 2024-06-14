class UserModel {
  String uid;
  String username;
  String email;
  String password;
  String photoURL;
  String currentLevel;

  UserModel({required this.uid,  required this.username, required this.email, required this.password, required this.photoURL, required this.currentLevel});

  
  Map<String, dynamic> toJson() => {
    "uid": uid,
    "username": username,
    "email": email,
    "photoUrl": photoURL,
    "currentLevel": currentLevel,
  };
}