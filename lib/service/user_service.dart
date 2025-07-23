import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:karachi_biennale/domain/models/user_model.dart';

abstract class UserService{
  Future<void> setUser(UserModel user);
  Future<UserModel> getUser(String uid);
}

class WCUserService extends UserService{

  @override
  Future<void> setUser(UserModel user) async{
     try{
       await FirebaseFirestore.instance.collection('users').doc(user.uid).set(user.toJson());
     }catch(e){
       debugPrint(e.toString());
     }
  }

  @override
  Future<UserModel> getUser(String uid) async{
    try{
      final ref = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (ref.exists && ref.data() != null) {
        return UserModel.fromJson(ref.data()!);
      } else {
        throw Exception("User not found in Firestore");
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }

}