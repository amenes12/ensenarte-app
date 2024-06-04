class UserModel {
  String uid;
  String username;
  String email;
  String password;
  String photoURL;

  UserModel({required this.uid,  required this.username, required this.email, required this.password, required this.photoURL});

  
  Map<String, dynamic> toJson() => {
    "uid": uid,
    "username": username,
    "email": email,
    "photoUrl": photoURL,
  };
}