import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';

class CustomCard extends StatelessWidget {
  final String? calenderIcon;
  final String? time;
  final String title;
  final String subtitle;
  final String leadingImage;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final GestureTapCallback? onTap;
  final Widget? trailing;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingImage,
    this.calenderIcon,
    this.time,
    this.onTap,
    this.trailing,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 112,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.borderColor),
          shape: BoxShape.rectangle,
          color: AppColors.whiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, top: 18, bottom: 18),
              width: 78,
              height: 76,
              child: Image.network(leadingImage, width: 78, height: 76, fit: BoxFit.cover),
              // child: Image.asset(leadingImage, fit: BoxFit.cover, width: 78, height: 76),
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
                if (time != null)
                  Row(
                    spacing: 4,
                    children: [
                      SvgPicture.asset(Strings.calenderClockIcon),
                      Text(time!, style: interLight.copyWith(fontSize: 15)),
                    ],
                  ),
              ],
            ),
            Spacer(),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
