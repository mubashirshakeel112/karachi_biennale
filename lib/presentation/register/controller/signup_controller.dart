import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karachi_biennale/domain/models/user_model.dart';
import 'package:karachi_biennale/presentation/home/controller/user_controller.dart';
import 'package:karachi_biennale/presentation/home/home_view.dart';
import 'package:karachi_biennale/repository/signup_repo.dart';
import 'package:karachi_biennale/repository/user_repo.dart';
import 'package:karachi_biennale/widgets/custom_snack_bar.dart';
import 'package:provider/provider.dart';

class SignupController extends ChangeNotifier{
  final SignupRepository _signupRepository = SignupRepository();
  final UserRepository _userRepository = UserRepository();
  bool _isLoading = false;
  String _userName = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  bool get isSignFormValid => _email.isNotEmpty && _password.isNotEmpty;
  bool get isPasswordValid => _confirmPassword == _password;
  bool get isLoading => _isLoading;
  String get userName => _userName;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  setUserName(String value){
    _userName = value;
    notifyListeners();
  }

  setEmail(String value){
    _email = value;
    notifyListeners();
  }

  setPassword(String value){
    _password = value;
    notifyListeners();
  }

  setConfirmPassword(String value){
    _confirmPassword = value;
    notifyListeners();
  }

  Future<void> signup(BuildContext context) async{
    try{
      setLoading(true);
      bool isSignup = await _signupRepository.signup(email, password);
      if(isSignup){
        await setUser();
        if(context.mounted) await Provider.of<UserController>(context, listen: false).getUser();
        if(context.mounted) CustomSnackBar.successSnackBar(context: context, title: 'Success', message: 'Signup Successfully',);
        if(context.mounted) Navigator.pushReplacementNamed(context, HomeView.id);
      }else{
        if(context.mounted) CustomSnackBar.errorSnackBar(context: context, title: 'Error', message: 'Login Failed');
      }
    }catch(e){
      if(context.mounted) CustomSnackBar.errorSnackBar(context: context, title: 'Error', message: e.toString());
    }finally{
      setLoading(false);
    }
  }

  Future<void> setUser() async{
    final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    try{
      final user = UserModel(name: _userName, email: _email, uid: uid);
      await _userRepository.setUser(user);
    }catch(e){
      debugPrint(e.toString());
    }
  }
}