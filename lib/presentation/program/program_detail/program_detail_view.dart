import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/presentation/artist/controller/artist_id_controller.dart';
import 'package:karachi_biennale/presentation/home/home_view.dart';
import 'package:karachi_biennale/presentation/program/controller/program_detailed_controller.dart';
import 'package:karachi_biennale/presentation/venues/controller/venue_detail_controller.dart';
import 'package:karachi_biennale/presentation/venues/venue/widgets/custom_venue_card.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';
import 'package:karachi_biennale/widgets/custom_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProgramDetailView extends StatefulWidget {
  static const String id = '/program_detail_view';
  final String programId;

  const ProgramDetailView({super.key, required this.programId});

  @override
  State<ProgramDetailView> createState() => _ProgramDetailViewState();
}

class _ProgramDetailViewState extends State<ProgramDetailView> {
  @override
  void initState() {
    Future.microtask(() async {
      final program = Provider.of<ProgramDetailedController>(context, listen: false);
      await program.getProgramById(widget.programId);
      final venue = Provider.of<VenueDetailController>(context, listen: false);
      await venue.getVenueById(program.program?.venue ?? '');
      Provider.of<ArtistIdController>(context, listen: false).getArtistsById(venue.venue?.artists ?? []);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProgramDetailedController>(
        builder: (context, programDetailController, child) {
          return programDetailController.isLoading
              ? Center(child: Lottie.asset(Strings.lottieLoadAnim, width: 80, height: 80))
              : Column(
                children: [
                  PrimaryAppBar(
                    height: 208,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 27, top: 42),
                      child: Column(
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(Strings.leftArrow),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pushNamed(context, HomeView.id);
                                },
                                child: SvgPicture.asset(Strings.homeIcon),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      programDetailController.program?.title ?? '',
                                      style: interBlack.copyWith(fontSize: 25, color: AppColors.whiteColor),
                                    ),
                                    Text(
                                      programDetailController.program?.subtitle ?? '',
                                      style: interLight.copyWith(fontSize: 15, color: AppColors.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(Strings.shareIcon),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 49),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 23),
                          child: Text(programDetailController.program?.description ?? '', style: interLight),
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
                                  Text(
                                    programDetailController.program?.date ?? '',
                                    style: interLight.copyWith(fontSize: 15),
                                  ),
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
                                  Text(
                                    programDetailController.program?.time ?? '',
                                    style: interLight.copyWith(fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 26, top: 23),
                          child: Text("Venue", style: interBold),
                        ),
                        Consumer<VenueDetailController>(
                          builder: (context, venueDetailController, child) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 22, top: 20),
                              child: VenueCard(
                                title: venueDetailController.venue?.title ?? '',
                                subtitle: venueDetailController.venue?.subtitle ?? '',
                                leadingImage: venueDetailController.venue?.image ?? '',
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22, top: 23),
                          child: Text("Artist", style: interBold),
                        ),
                        SizedBox(height: 20),
                        Consumer<ArtistIdController>(
                          builder: (context, artistIdController, child) {
                            return SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: artistIdController.artists.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                      width: 128,
                                      child:
                                          artistIdController.isLoading
                                              ? Center(
                                                child: CircularProgressIndicator(
                                                  color: AppColors.disabled,
                                                  strokeWidth: 5,
                                                ),
                                              )
                                              : Column(
                                                children: [
                                                  Image.network(
                                                    artistIdController.artists[index].imageUrl,
                                                    fit: BoxFit.cover,
                                                    width: 128,
                                                    height: 124,
                                                  ),
                                                  SizedBox(height: 16),
                                                  Text(
                                                    artistIdController.artists[index].name,
                                                    textAlign: TextAlign.center,
                                                    style: interRegular.copyWith(
                                                      fontSize: 18,
                                                      color: AppColors.textColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  ),
                ],
              );
        },
      ),
    );
  }
}
