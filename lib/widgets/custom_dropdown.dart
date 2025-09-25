import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';

class CustomDropdown extends StatelessWidget {
   final List<String> items;
   final Function onChange;
   final String hintText;
   final String? initialValue;

   const CustomDropdown({super.key, required this.items, required this.onChange, required this.hintText, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.offWhiteColor,
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      ),
        value: initialValue ?? items[0],
        dropdownColor: AppColors.offWhiteColor,
        elevation: 0,
        isExpanded: true,
        isDense: true,
        itemHeight: 50,
        hint: Text(hintText),
        icon: RotatedBox(
            quarterTurns: 45,
            child: SvgPicture.asset(Strings.chevronArrow,)),
        items: items.map<DropdownMenuItem<String>>((String value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: interLight,),
          );
        }).toList(),
        onChanged: (value){
            // onChange(value);
        }
    );
  }
}
