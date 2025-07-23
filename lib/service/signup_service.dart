import 'package:firebase_auth/firebase_auth.dart';
import 'package:karachi_biennale/widgets/firebase_error_handler.dart';

abstract class SignupService{
  Future<bool> signup(String email, String password);
}

class WCSignupService extends SignupService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<bool> signup(String email, String password) async{
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    }catch(e){
      throw Exception(FirebaseErrorHandler.handleFirebaseError(e));
    }
  }
}