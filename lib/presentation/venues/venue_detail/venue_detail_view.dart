import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/presentation/artist/controller/artist_id_controller.dart';
import 'package:karachi_biennale/presentation/venues/controller/venue_detail_controller.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class VenueDetailView extends StatefulWidget {
  static const String id = '/venue_detail_view';
  final String venueId;

  const VenueDetailView({super.key, required this.venueId});

  @override
  State<VenueDetailView> createState() => _VenueDetailViewState();
}

class _VenueDetailViewState extends State<VenueDetailView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final venueController = Provider.of<VenueDetailController>(context, listen: false);
      await venueController.getVenueById(widget.venueId);

      final artistIds = venueController.venue?.artists ?? [];
      if (artistIds.isNotEmpty) {
        final artistIdController = Provider.of<ArtistIdController>(context, listen: false);
        artistIdController.getArtistsById(artistIds);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double appbarHeight = 205;
    return Scaffold(
      body: Consumer<VenueDetailController>(
        builder: (context, venueDetailController, child) {
          return Stack(
            children: [
              Column(
                children: [
                  PrimaryAppBar(height: appbarHeight,),
                  venueDetailController.isLoading
                      ? Expanded(child: Lottie.asset(Strings.lottieLoadAnim, width: 80, height: 80))
                      : Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: appbarHeight / 1.35),
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                venueDetailController.venue?.title ?? '',
                                style: interBold.copyWith(fontSize: 25),
                              ),
                              Text(venueDetailController.venue?.subtitle ?? '', style: interLight),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: Color(0xFFF9F9F9),
                          margin: EdgeInsets.only(top: 35),
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 22),
                                child: Text("Address", style: interBold),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 22),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 5,
                                  children: [
                                    SvgPicture.asset(Strings.pinIcon),
                                    Expanded(
                                      child: Text(venueDetailController.venue?.location ?? '', style: interLight),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(height: 15, color: AppColors.borderColor, thickness: 2),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 22),
                                child: Text("Phone", style: interBold),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 22),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 5,
                                  children: [
                                    SvgPicture.asset(Strings.callIcon),
                                    Expanded(
                                      child: Text(venueDetailController.venue?.phone ?? '', style: interLight),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 22, top: 35),
                          child: Text("Artists", style: interBold),
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
                                        child: CircularProgressIndicator(color: AppColors.disabled, strokeWidth: 5,),
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
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(top: appbarHeight / 1.8, left: 20, right: 20, child: Image.asset(Strings.venueDetailImage)),
            ],
          );
        },
      ),
    );
  }
}
