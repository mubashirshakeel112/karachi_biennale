import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/presentation/home/home_view.dart';

class PrimaryAppBar extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? child;
  final double? height;
  final Function()? onHomeTap;

  const PrimaryAppBar({super.key, this.title, this.subtitle, this.child, this.height, this.onHomeTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 205,
      color: AppColors.primaryColor,
      child:
          child ??
          Padding(
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
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(padding: const EdgeInsets.all(8.0), child: SvgPicture.asset(Strings.leftArrow)),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: onHomeTap,
                      child: SvgPicture.asset(Strings.homeIcon),
                    ),
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
        padding: const EdgeInsets.only(left: 12, right: 27, top: 42),
        child: Row(
          children: [
            Material(
              color: AppColors.primaryColor,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(padding: const EdgeInsets.all(8.0), child: SvgPicture.asset(Strings.leftArrow)),
              ),
            ),
            SizedBox(width: 7),
            Expanded(child: Text(title ?? '', style: interBlack.copyWith(fontSize: 25, color: AppColors.whiteColor))),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.pushNamed(context, HomeView.id);
              },
              child: SvgPicture.asset(Strings.homeIcon),
            ),
          ],
        ),
      ),
    );
  }
}
