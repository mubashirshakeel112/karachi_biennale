import 'package:flutter/material.dart';
import 'package:karachi_biennale/presentation/home/controller/user_controller.dart';
import 'package:karachi_biennale/presentation/home/home_view.dart';
import 'package:karachi_biennale/repository/login_repo.dart';
import 'package:karachi_biennale/widgets/custom_snack_bar.dart';
import 'package:provider/provider.dart';

class LoginController extends ChangeNotifier{
  final LoginRepository _loginRepository = LoginRepository();
  bool _isLoading = false;
  String _email = '';
  String _password = '';

  bool get isFormValid => _email.isNotEmpty && _password.isNotEmpty;
  bool get isLoading => _isLoading;
  String get email => _email;
  String get password => _password;

  void setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  void setEmail(String value){
    _email = value;
    notifyListeners();
  }

  void setPassword(String value){
    _password = value;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async{
    try{
      setLoading(true);
      bool isLogin = await _loginRepository.login(email, password);
      if(isLogin){
        if(context.mounted) await Provider.of<UserController>(context, listen: false).getUser();
        if(context.mounted) CustomSnackBar.successSnackBar(context: context, title: 'Success', message: 'Login Successfully', );
        if(context.mounted) Navigator.pushNamedAndRemoveUntil(context, HomeView.id, (Route<dynamic> route) => false);
      }else{
        if(context.mounted) CustomSnackBar.errorSnackBar(context: context, title: 'Error', message: 'Login Failed',);
      }
    }catch(e){
      if(context.mounted) CustomSnackBar.errorSnackBar(context: context, title: 'Error', message: e.toString(), );
    }finally{
      setLoading(false);
    }
  }
}