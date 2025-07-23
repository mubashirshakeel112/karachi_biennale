import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String uid;
  String name;
  String email;

  UserModel({required this.name, required this.email, required this.uid});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    return UserModel(uid: uid, name: json['name'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {'uid': uid, 'name': name, 'email': email};
  }
}
