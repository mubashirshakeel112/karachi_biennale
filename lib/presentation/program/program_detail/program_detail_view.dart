import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';
import 'package:karachi_biennale/widgets/custom_button.dart';
import 'package:karachi_biennale/widgets/custom_card.dart';

class ProgramDetailView extends StatelessWidget {
  static const String id = '/program_detail_view';

  const ProgramDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.primaryAppBar(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Art Think Tank', style: interBold.copyWith(fontSize: 25, color: AppColors.whiteColor),),
                  Text('Seminar', style: interLight.copyWith(fontSize: 15, color: AppColors.whiteColor),),
                ],
              ),
              SvgPicture.asset(Strings.shareIcon),
            ],
          ),
        )
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            left: 0,
            right: 0,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 23),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vulputate nunc arcu augue id neque mauris.",
                    style: interLight,
                  ),
                ),
                Container(
                  height: 74,
                  color: Color(0xFFF9F9F9),
                  padding: EdgeInsets.only(left: 20),
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Row(
                        spacing: 4,
                        children: [
                          SvgPicture.asset(Strings.calenderIcon),
                          Text("Monday 24 March 2022", style: interLight.copyWith(fontSize: 15)),
                        ],
                      ),
                      RotatedBox(
                        quarterTurns: -90,
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                          decoration: BoxDecoration(border: Border.all(width: 2, color: AppColors.borderColor)),
                        ),
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          SvgPicture.asset(Strings.calenderClockIcon),
                          Text("1 : 00 PM", style: interLight.copyWith(fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 26, top: 23), child: Text("Venue", style: interBold)),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 20),
                  child: CustomCard(
                    title: "Karachi School Art ",
                    subtitle: "Lorem ipsum dolor sit ...",
                    leadingImage: Strings.venueListImage1,
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 22, top: 23), child: Text("Artist", style: interBold)),
                // UiHelper.artistRow(context),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 49,
            child: CustomButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Strings.bookmarkOutlineIcon,
                    colorFilter: ColorFilter.mode(AppColors.textColor, BlendMode.srcIn),
                    width: 30,
                    height: 25,
                  ),
                  SizedBox(width: 9),
                  Text('Add to event', style: interBold),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
