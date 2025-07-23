import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';

class VenueDetailView extends StatelessWidget {
  static const String id = '/venue_detail_view';
  const VenueDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar.primaryAppBar(),
          ),
          Positioned(
            top: 117,
            left: 20,
            right: 20,
            child: Image.asset(Strings.venueDetailImage),
          ),
          Positioned.fill(
            top: 320,
            left: 0,
            right: 0,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 26),
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Karachi School Art", style: interBold.copyWith(fontSize: 25),),
                      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vulputate nunc arcu augue id neque mauris. Dui sed suspendisse augue risus. Arcu egestas ut eget aliquam aliquet. Mi phasellus neque nunc ut pellentesque arcu. Arcu viverra leo eleifend pellentesque sed aliquam pellentesque quam.", style: interLight),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 109,
                  color: Color(0xFFF9F9F9),
                  margin: EdgeInsets.only(top: 35),
                  padding: EdgeInsets.only(left: 22, right: 18, top: 15,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Address", style: interBold),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          SvgPicture.asset(Strings.pinIcon,),
                          Expanded(child: Text("Lorem ipsum dolor sit amet, consecte tur adipiscing elit.", style: interLight))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: AppColors.borderColor)
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 109,
                  color: Color(0xFFF9F9F9),
                  padding: EdgeInsets.only(left: 22, right: 18, top: 15,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone", style: interBold),
                      SizedBox(height: 5,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 5,
                        children: [
                          SvgPicture.asset(Strings.callIcon),
                          Expanded(child: Text("+92 222 2219848", style: interLight)),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 35),
                  child: Text("Artists", style: interBold),
                ),
                // UiHelper.artistRow(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}
