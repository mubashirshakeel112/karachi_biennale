import 'package:flutter/material.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/typography.dart';

class CustomLoader extends StatelessWidget {
  final String title;
  final double? height;
  const CustomLoader({super.key, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 60,
      color: AppColors.secondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(color: AppColors.textColor,),
          ),
          SizedBox(width: 15,),
          Text(title, style: interBold.copyWith(color: AppColors.textColor),),
        ],
      ),
    );
  }
}
