import 'package:flutter/material.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/typography.dart';

class VenueCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String leadingImage;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final GestureTapCallback? onTap;

  const VenueCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingImage,
    this.onTap,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: padding ?? EdgeInsets.only(left: 17, top: 18, bottom: 18, right: 76),
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
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: interBold),
                  SizedBox(height: 2),
                  Text(subtitle, style: interLight.copyWith(fontSize: 15), overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
