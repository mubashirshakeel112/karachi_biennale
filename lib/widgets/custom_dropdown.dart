// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:karachi_biennale/constants/app_colors.dart';
// import 'package:karachi_biennale/constants/strings.dart';
//
// class CustomDropdown extends StatelessWidget {
//   List<DropdownMenuItem> items = [];
//   final Function(dynamic)? onChanged;
//   String? selectedItem;
//    CustomDropdown({super.key, required this.items, required this.onChanged, required this.selectedItem});
//
//   @override
//   Widget build(BuildContext context) {
//     return  DropdownButtonHideUnderline(
//       child: DropdownButton2(
//         isExpanded: true,
//         value: selectedItem,
//         items: items,
//         onChanged: onChanged,
//         buttonStyleData: ButtonStyleData(
//           width: MediaQuery.of(context).size.width,
//           height: 55,
//           padding: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
//           decoration: BoxDecoration(
//             color: AppColors.offWhiteColor,
//           )
//         ),
//         dropdownStyleData: DropdownStyleData(
//           decoration: BoxDecoration(
//             color: AppColors.offWhiteColor
//           )
//         ),
//         iconStyleData: IconStyleData(
//           icon: RotatedBox(
//               quarterTurns: 45,
//               child: SvgPicture.asset(Strings.chevronArrow, width: 18, height: 18,)),
//         ),
//       ),
//     );
//   }
// }

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
            child: SvgPicture.asset(Strings.chevronArrow, width: 40, height: 40,)),
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
