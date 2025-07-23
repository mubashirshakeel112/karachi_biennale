import 'package:flutter/material.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/typography.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isSuffixIconShow;
  final BorderSide? borderSide;
  final EdgeInsets? padding;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool filled;
  final Color? fillColor;
  final Function(String)? onChanged;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final EdgeInsets? margin;

  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.isSuffixIconShow = false,
    this.borderSide,
    this.padding,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
    this.filled = false,
    this.fillColor,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        cursorColor: AppColors.textColor,
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscuringCharacter: '.',
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          prefixIconConstraints: const BoxConstraints(minWidth: 27, minHeight: 27),
          prefixIcon: prefixIcon != null ? Padding(
            padding: const EdgeInsets.only(left: 15),
            child: prefixIcon,
          ): null,
          suffixIconConstraints:BoxConstraints(minWidth: 25, minHeight: 25),
          suffixIcon: isSuffixIconShow ? Padding(
            padding: const EdgeInsets.only(right: 15),
            child: suffixIcon,
          ) : null,
          hintText: hintText,
          hintStyle: interLight,
          contentPadding: padding ?? EdgeInsets.symmetric(horizontal: 15, vertical: 19),
          isDense: true,
          filled: filled,
          fillColor: fillColor ?? AppColors.whiteColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: borderSide ?? BorderSide(width: 2, color: AppColors.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: borderSide ?? BorderSide(width: 2, color: AppColors.borderColor),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
