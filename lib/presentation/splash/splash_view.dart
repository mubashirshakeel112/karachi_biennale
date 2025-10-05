import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/presentation/home/home_view.dart';
import 'package:karachi_biennale/presentation/login/login_view.dart';

class SplashView extends StatefulWidget {
  static const String id = '/splash_view';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // checkUserExistRepository.isUserExist();
    Future.delayed(Duration(seconds: 3),(){
      bool isUserExist = checkUser();
      if(isUserExist == true){
        Navigator.pushReplacementNamed(context, HomeView.id);
      }else{
        Navigator.pushReplacementNamed(context, LoginView.id);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Strings.splash, width: 250, height: 250,),
      ),
    );
  }

  bool checkUser(){
    final user = FirebaseAuth.instance.currentUser;
    if(user != null){
      return true;
    }else{
      return false;
    }
  }
}
