import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';

class CustomAppBar {
  static PreferredSizeWidget primaryAppBar({
    String? title,
    String? subtitle,
    Widget? child,
    Widget? leading,
    Widget? trailing,
    double? height,
  }) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      toolbarHeight: height ?? 205,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(left: 20, right: 27, top: 61),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leading ?? SvgPicture.asset(Strings.leftArrow),
                trailing ?? SvgPicture.asset(Strings.homeIcon),
              ],
            ),
            SizedBox(height: 29),
            child ??
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title ?? '', style: interBlack),
                    SizedBox(height: 6),
                    Text(subtitle ?? '', style: interLight.copyWith(color: AppColors.whiteColor)),
                  ],
                ),
          ],
        ),
      ),
    );
  }

  static PreferredSizeWidget secondaryAppBar({required BuildContext context,String? title, Widget? leading, Widget? trailing, double? height}) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      toolbarHeight: height ?? 90,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(left: 20, right: 27, top: 61),
        child: Row(
          children: [
            leading ?? GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(Strings.leftArrow)),
            SizedBox(width: 15),
            Expanded(child: Text(title ?? '', style: interBold.copyWith(fontSize: 25, color: AppColors.whiteColor))),
            trailing ?? SvgPicture.asset(Strings.homeIcon),
          ],
        ),
      ),
    );
  }
}

// class CustomAppBar {
//   static PreferredSizeWidget appBar({
//     Text? title,
//     Text? subTitle,
//     Text? titleTop,
//     // Image? leadingTop;
//     required double appBarHeight,
//     Image? listTileTrailing,
//     double listTileTopPadding = 25,
//     required BuildContext context,
//   }) {
//     final statusBarHeight = MediaQuery.of(context).padding.top;
//     final appbarHeight = appBarHeight - statusBarHeight;
//     return PreferredSize(
//       preferredSize: Size.fromHeight(appbarHeight),
//       child: AppBar(
//         automaticallyImplyLeading: false,
//         toolbarHeight: appbarHeight,
//         backgroundColor: AppColors.primaryColor,
//         flexibleSpace: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 27, top: 61),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ImageIcon(
//                     AssetImage(Strings.leftArrow),
//                     size: 35,
//                     color: AppColors.whiteColor,
//                   ),
//                   SizedBox(width: 15),
//                   if (titleTop != null) Expanded(child: titleTop),
//                   ImageIcon(
//                     AssetImage(Strings.homeIcon),
//                     size: 35,
//                     color: AppColors.whiteColor,
//                   ),
//                 ],
//               ),
//             ),
//             if (title != null || subTitle != null)
//               ListTile(
//                 minTileHeight: 0,
//                 minVerticalPadding: 0,
//                 minLeadingWidth: 0,
//                 horizontalTitleGap: 0,
//                 dense: true,
//                 contentPadding: EdgeInsets.only(
//                   left: 27,
//                   right: 31,
//                   top: listTileTopPadding,
//                 ),
//                 title: title,
//                 subtitle: subTitle,
//                 trailing: listTileTrailing,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Text? title;
//   final Text? subTitle;
//   final Text? titleTop;
//   final double appBarHeight;
//   final Image? listTileTrailing;
//   final double listTileTopPadding;

//   const CustomAppBar({
//     super.key,
//     this.title,
//     this.subTitle,
//     this.titleTop,
//     required this.appBarHeight,
//     this.listTileTrailing,
//     this.listTileTopPadding = 25,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final statusbarHeight = MediaQuery.of(context).padding.top;
//     final appbarHeight = appBarHeight - statusbarHeight;
//     return PreferredSize(
//       preferredSize: Size.fromHeight(appbarHeight),
//       child: AppBar(
//         toolbarHeight: appbarHeight,
//         backgroundColor: ColorConstant.primaryColor,
//         flexibleSpace: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 27, top: 61),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ImageIcon(
//                     AssetImage(ImageConstant.leftArrow),
//                     size: 35,
//                     color: ColorConstant.whiteColor,
//                   ),
//                   SizedBox(width: 15),
//                   if (titleTop != null) Expanded(child: titleTop!),
//                   ImageIcon(
//                     AssetImage(ImageConstant.homeIcon),
//                     size: 35,
//                     color: ColorConstant.whiteColor,
//                   ),
//                 ],
//               ),
//             ),
//             if (title != null || subTitle != null)
//               ListTile(
//                 minTileHeight: 0,
//                 minVerticalPadding: 0,
//                 minLeadingWidth: 0,
//                 horizontalTitleGap: 0,
//                 dense: true,
//                 contentPadding: EdgeInsets.only(
//                   left: 27,
//                   right: 31,
//                   top: listTileTopPadding,
//                 ),
//                 title: title,
//                 subtitle: subTitle,
//                 trailing: listTileTrailing,
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(appBarHeight);
// }
