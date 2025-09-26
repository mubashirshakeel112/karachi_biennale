import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/presentation/about/about_view.dart';
import 'package:karachi_biennale/presentation/artist/artist_view.dart';
import 'package:karachi_biennale/presentation/event/my_event_view.dart';
import 'package:karachi_biennale/presentation/home/controller/logout_controller.dart';
import 'package:karachi_biennale/presentation/home/controller/user_controller.dart';
import 'package:karachi_biennale/presentation/program/program_dropdown/program_view.dart';
import 'package:karachi_biennale/presentation/search/search_view.dart';
import 'package:karachi_biennale/presentation/venues/venue/venue_view.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static const String id = '/home_view';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserController>(context, listen: false).getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double appBarHeight = 265 ;
    final List<GridItems> items = [
      GridItems(
        text: "About KB22",
        image: Strings.infoCircleIcon,
        onTap: () {
          Navigator.pushNamed(context, AboutView.id);
        },
      ),
      GridItems(
        text: "Public Program",
        image: Strings.multipleUsersIcon,
        onTap: () {
          Navigator.pushNamed(context, ProgramView.id);
        },
      ),
      GridItems(
        text: "Venues",
        image: Strings.flagIcon,
        onTap: () {
          Navigator.pushNamed(context, VenueView.id);
        },
      ),
      GridItems(text: "Prize / Voting", image: Strings.trophyIcon, onTap: () {}),
      GridItems(
        text: "Artist list",
        image: Strings.listPointersIcon,
        onTap: () {
          Navigator.pushNamed(context, ArtistView.id);
        },
      ),
      GridItems(
        text: "Search",
        image: Strings.searchIcon,
        onTap: () {
          Navigator.pushNamed(context, SearchView.id);
        },
      ),
    ];
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      key: key,
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(left: 20, bottom: 27, top: 10, right: 10),
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: AppColors.primaryColor),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "KB", style: interBlack.copyWith(fontSize: 60)),
                          TextSpan(
                            text: "22",
                            style: interBlack.copyWith(fontSize: 60, color: AppColors.secondaryColor),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Consumer<UserController>(
                      builder: (context, userController, child) {
                        if (userController.isLoading) {
                          return CircularProgressIndicator();
                        }
                        return FittedBox(
                          child: Text(
                            userController.userData?.name ?? '',
                            style: interLight.copyWith(fontSize: 25, color: AppColors.whiteColor),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, VenueView.id);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text("Venues", style: interLight.copyWith(fontSize: 25)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ProgramView.id);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text("Programs", style: interLight.copyWith(fontSize: 25)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ArtistView.id);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text("Artist", style: interLight.copyWith(fontSize: 25)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AboutView.id);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Text("About", style: interLight.copyWith(fontSize: 25)),
                  ),
                ),
              ],
            ),
            Spacer(),
            Consumer<LogoutController>(
              builder: (context, provider, child) {
                return ListTile(
                  minVerticalPadding: 0,
                  minLeadingWidth: 0,
                  minTileHeight: 0,
                  horizontalTitleGap: 0,
                  tileColor: AppColors.textColor,
                  onTap: () {
                    provider.logout(context);
                  },
                  contentPadding: EdgeInsets.only(left: 20, top: 20, bottom: 21, right: 18),
                  title: Text("Login", style: interLight.copyWith(fontSize: 25, color: AppColors.whiteColor)),
                  trailing: SvgPicture.asset(Strings.logoutIcon),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              PrimaryAppBar(
                height: appBarHeight,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 62),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          onTap: () => key.currentState!.openDrawer(),
                          child: SvgPicture.asset(Strings.drawerIcon),
                        ),
                        SizedBox(width: 12,),
                        Expanded(child: Text("YOUR GUIDE TO", style: interBlack.copyWith(fontSize: 25, color: AppColors.whiteColor))),
                        InkWell(
                          splashColor: Colors.transparent,
                          onTap: () => Navigator.pushNamed(context, MyEventView.id),
                          child: SvgPicture.asset(Strings.bookmarkOutlineIcon),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 20, right: 20, top: appBarHeight / 2.1, bottom: 10),
                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 165 / 120,
                  ),
                  itemBuilder: (context, index) {
                    return Material(
                      color: AppColors.darkBackground,
                      child: InkWell(
                        onTap: items[index].onTap,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(items[index].image),
                              SizedBox(height: 4),
                              Text(items[index].text, style: interBold),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: 265 / 2,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.only(top: 24.23, left: 20, bottom: 21),
              color: AppColors.secondaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(Strings.appLogo, width: 136, height: 63, fit: BoxFit.cover),
                  SizedBox(height: 14),
                  Text("Third Karachi Biennale", style: interRegular.copyWith(fontSize: 20)),
                  Text(
                    "Pakistan’s largest international\ncontemporary art event",
                    style: interRegular.copyWith(fontSize: 15),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "31 October - 13 November 2022",
                    style: interBlack.copyWith(fontSize: 20, color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridItems {
  String text;
  String image;
  GestureTapCallback onTap;

  GridItems({required this.text, required this.image, required this.onTap});
}
