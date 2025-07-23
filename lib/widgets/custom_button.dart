import 'package:flutter/material.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/typography.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Widget? child;
  final Color? bgColor;
  final double? width;
  final double? height;
  final double radius;
  final VoidCallback? onPressed;

  const CustomButton({super.key, this.title, required this.onPressed, this.child, this.bgColor, this.width, this.height, this.radius = 0});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: width ?? double.infinity,
        height: height ?? 60,
        color: bgColor ?? AppColors.secondaryColor,
        disabledColor: AppColors.disabled,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(radius),
          side: BorderSide.none
        ),
        onPressed: onPressed,
        child: child ?? Text(title ?? '', style: interBold.copyWith(color: AppColors.blackColor),),
    );
  }
}
