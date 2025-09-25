import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/presentation/home/home_view.dart';

// class CustomAppBar {
//   static PreferredSizeWidget primaryAppBar({
//     String? title,
//     String? subtitle,
//     Widget? child,
//     double? height,
//   }) {
//     return AppBar(
//       backgroundColor: AppColors.primaryColor,
//       toolbarHeight: height ?? 205,
//       automaticallyImplyLeading: false,
//       scrolledUnderElevation: 0,
//       flexibleSpace: Padding(
//         padding: const EdgeInsets.only(left: 20, right: 27, top: 61),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SvgPicture.asset(Strings.leftArrow),
//                 SvgPicture.asset(Strings.homeIcon),
//               ],
//             ),
//             SizedBox(height: 29),
//             child ??
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(title ?? '', style: interBlack),
//                     SizedBox(height: 6),
//                     Text(subtitle ?? '', style: interLight.copyWith(color: AppColors.whiteColor)),
//                   ],
//                 ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   static PreferredSizeWidget secondaryAppBar({required BuildContext context,String? title, double? height}) {
//     return AppBar(
//       backgroundColor: AppColors.primaryColor,
//       toolbarHeight: height ?? 90,
//       automaticallyImplyLeading: false,
//       scrolledUnderElevation: 0,
//       flexibleSpace: Padding(
//         padding: const EdgeInsets.only(left: 12, right: 19, top: 53),
//         child: Row(
//           children: [
//             InkWell(
//               borderRadius: BorderRadius.circular(50),
//                 onTap: (){
//                   Navigator.pop(context);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SvgPicture.asset(Strings.leftArrow),
//                 )),
//             SizedBox(width: 7),
//             Expanded(child: Text(title ?? '', style: interBold.copyWith(fontSize: 25, color: AppColors.whiteColor))),
//             InkWell(
//               borderRadius: BorderRadius.circular(50),
//                 onTap: (){
//                   Navigator.pushNamed(context, HomeView.id);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SvgPicture.asset(Strings.homeIcon),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

class PrimaryAppBar extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? child;
  final double? height;
  const PrimaryAppBar({super.key, this.title, this.subtitle, this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 205,
      color: AppColors.primaryColor,
      child: child ?? Padding(
        padding: const EdgeInsets.only(left: 12, right: 27, top: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: AppColors.primaryColor,
                  child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(Strings.leftArrow),
                      )),
                ),
                SvgPicture.asset(Strings.homeIcon),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title ?? '', style: interBlack.copyWith(fontSize: 35, color: AppColors.whiteColor)),
                      SizedBox(height: 2),
                      Text(subtitle ?? '', style: interLight.copyWith(color: AppColors.whiteColor)),
                    ],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondaryAppBar extends StatelessWidget {
  final String? title;
  final double? height;
  const SecondaryAppBar({super.key, this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 120,
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 19, top: 42),
        child: Row(
          children: [
            Material(
              color: AppColors.primaryColor,
              child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(Strings.leftArrow),
                  )),
            ),
            SizedBox(width: 7),
            Expanded(child: Text(title ?? '', style: interBlack.copyWith(fontSize: 25, color: AppColors.whiteColor))),
            InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: (){
                  Navigator.pushNamed(context, HomeView.id);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(Strings.homeIcon),
                )),
          ],
        ),
      ),
    );
  }
}
