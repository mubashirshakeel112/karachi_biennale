import 'package:flutter/material.dart';
import 'package:karachi_biennale/presentation/login/login_view.dart';
import 'package:karachi_biennale/repository/logout_repo.dart';
import 'package:karachi_biennale/widgets/custom_snack_bar.dart';

class LogoutController extends ChangeNotifier{
  final LogoutRepository _logoutRepository = LogoutRepository();

  Future<void> logout(BuildContext context) async{
    try{
      bool isLogout = await _logoutRepository.logout();
      if(isLogout){
        if(context.mounted) CustomSnackBar.successSnackBar(context: context, title: 'Success', message: 'Logout Successfully', );
        if(context.mounted) Navigator.pushReplacementNamed(context, LoginView.id);
      }else{
        if(context.mounted) CustomSnackBar.errorSnackBar(context: context, title: 'Error', message: 'Logout Failed');
      }
    }catch(e){
      if(context.mounted) CustomSnackBar.errorSnackBar(context: context, title: 'Error', message: e.toString());
    }
  }
}