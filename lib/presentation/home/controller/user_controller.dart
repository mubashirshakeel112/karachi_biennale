import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:karachi_biennale/domain/models/user_model.dart';
import 'package:karachi_biennale/repository/user_repo.dart';

class UserController extends ChangeNotifier{
  final UserRepository _userRepository = UserRepository();
  bool _isLoading = false;
  UserModel? _userData;
  bool get isLoading => _isLoading;
  UserModel? get userData => _userData;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }
  Future<void> getUser() async{
    try{
      setLoading(true);
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if(uid != null){
        _userData = await _userRepository.getUser(uid);
        notifyListeners();
      }
    }catch(e){
      debugPrint(e.toString());
    }finally{
      setLoading(false);
    }
  }
}