import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';

class ProgramCard extends StatelessWidget {
  final String? calenderIcon;
  final String time;
  final String title;
  final String subtitle;
  final String leadingImage;
  final String bookmarkIcon;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final GestureTapCallback? onTap;
  final VoidCallback? onBookmarkedPressed;

  const ProgramCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingImage,
    this.calenderIcon,
    required this.time,
    this.onTap,
    this.padding,
    this.margin, this.onBookmarkedPressed, required this.bookmarkIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 112,
        padding: padding ?? EdgeInsets.only(left: 16,),
        margin: margin,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.borderColor),
          shape: BoxShape.rectangle,
          color: AppColors.whiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 78,
              height: 76,
              child: Image.network(leadingImage, width: 78, height: 76, fit: BoxFit.cover),
            ),
            SizedBox(width: 17),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: interBold),
                SizedBox(height: 2),
                Text(subtitle, style: interLight.copyWith(fontSize: 15)),
                SizedBox(height: 4),
                  Row(
                    spacing: 4,
                    children: [
                      SvgPicture.asset(Strings.calenderClockIcon),
                      Text(time, style: interLight.copyWith(fontSize: 15)),
                    ],
                  ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: onBookmarkedPressed,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 38,
                    height: 37,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(bookmarkIcon, width: 30, height: 25, color: AppColors.textColor,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
