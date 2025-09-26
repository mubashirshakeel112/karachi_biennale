import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';

class ArtistCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String leadingImage;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final GestureTapCallback? onTap;
  final VoidCallback? onVote;
  final Widget? trailing;
  final bool isVoted;
  final bool isUnvoted;

  const ArtistCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingImage,
    this.onTap,
    this.trailing,
    this.padding,
    this.margin,
    this.onVote,
    required this.isVoted,
    required this.isUnvoted,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    if (isVoted) {
      buttonColor = AppColors.secondaryColor;
    } else if (isUnvoted) {
      buttonColor = AppColors.danger;
    } else {
      buttonColor = AppColors.disabled;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 112,
        padding: padding ?? EdgeInsets.only(left: 16, top: 18, bottom: 18, right: 15),
        margin: margin,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.borderColor),
          color: AppColors.whiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 78, height: 76, child: Image.network(leadingImage, fit: BoxFit.cover)),
            SizedBox(width: 17),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: interBold),
                SizedBox(height: 2),
                Text(subtitle, style: interLight.copyWith(fontSize: 15)),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: onVote,
              child: Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: buttonColor),
                child: SvgPicture.asset(
                  isVoted
                      ? Strings
                          .checkIcon
                      : isUnvoted
                      ? Strings
                          .crossIcon
                      : Strings.checkIcon,
                  colorFilter: ColorFilter.mode(
                    isVoted
                        ? AppColors.textColor
                        : isUnvoted
                        ? AppColors.whiteColor
                        : AppColors.textColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
