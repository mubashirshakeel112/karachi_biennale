import 'package:flutter/material.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';

class SplashView extends StatefulWidget {
  static const String id = '/splash_view';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Strings.aboutImage1, width: 200, height: 200,),
            Text('Karachi Biennale', style: interBold.copyWith(color: AppColors.primaryColor),),
          ],
        ),
      ),
    );
  }
}
