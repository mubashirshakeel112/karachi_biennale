import 'package:firebase_auth/firebase_auth.dart';
import 'package:karachi_biennale/widgets/firebase_error_handler.dart';

abstract class ForgetPasswordService{
  Future<bool> forgetPassword(String email);
}

class WCForgetPasswordService extends ForgetPasswordService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<bool> forgetPassword(String email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    }catch(e){
      throw Exception(FirebaseErrorHandler.handleFirebaseError(e));
    }
  }

}