import 'package:firebase_auth/firebase_auth.dart';
import 'package:karachi_biennale/widgets/firebase_error_handler.dart';

abstract class LogoutService{
  Future<bool> logout();
}

class WCLogoutService extends LogoutService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<bool> logout() async{
    try{
      await _auth.signOut();
      return true;
    }catch(e){
      throw Exception(FirebaseErrorHandler.handleFirebaseError(e));
    }
  }
}