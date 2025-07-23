import 'package:firebase_auth/firebase_auth.dart';
import 'package:karachi_biennale/presentation/home/home_view.dart';
import 'package:karachi_biennale/presentation/login/login_view.dart';

abstract class CheckUserExistService{
  String isUserExist();
}

class WCUserService extends CheckUserExistService{
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  String isUserExist() {
    if(user != null){
      return HomeView.id;
    }else{
      return LoginView.id;
    }
  }

}