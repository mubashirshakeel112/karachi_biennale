import 'package:firebase_auth/firebase_auth.dart';
import 'package:karachi_biennale/widgets/firebase_error_handler.dart';

abstract class LoginService{
  Future<bool> login(String email, String password);
}

class WCLoginService extends LoginService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<bool> login(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }catch(e){
      throw Exception(FirebaseErrorHandler.handleFirebaseError(e));
    }
  }
}