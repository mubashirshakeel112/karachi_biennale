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
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<UserController>(context, listen: false).getUser();
    });
  }
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = 265 - statusBarHeight;
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
      GridItems(
        text: "Prize / Voting",
        image: Strings.trophyIcon,
        onTap: () {},
      ),
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
                          TextSpan(
                            text: "KB",
                            style: interBlack.copyWith(fontSize: 60),
                          ),
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
                          return CircularProgressIndicator(); // or a SizedBox.shrink() if small UI
                        }
                        return FittedBox(
                          child: Text(
                             userController.userData?.name ?? '',
                            style: interLight.copyWith(fontSize: 25, color: AppColors.whiteColor),
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, VenueView.id);
                    },
                    child: Text(
                      "Venues",
                      style: interLight.copyWith(fontSize: 25),
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, ProgramView.id);
                    },
                    child: Text(
                      "Programs",
                      style: interLight.copyWith(fontSize: 25),
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, ArtistView.id);
                    },
                    child: Text(
                      "Artist",
                      style: interLight.copyWith(fontSize: 25),
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AboutView.id);
                    },
                    child: Text(
                      "About",
                      style: interLight.copyWith(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Consumer<LogoutController>(
              builder: (context, provider, child) {
                return Container(
                  color: AppColors.textColor,
                  child: ListTile(
                    minVerticalPadding: 0,
                    minLeadingWidth: 0,
                    minTileHeight: 0,
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.only(
                      left: 20,
                      top: 20,
                      bottom: 21,
                      right: 18,
                    ),
                    title: Text(
                      "Login",
                      style: interLight.copyWith(fontSize: 25, color: AppColors.whiteColor),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        provider.logout(context);
                      },
                      child: SvgPicture.asset(
                        Strings.logoutIcon,
                      ),
                    ),
                  ),
                );
              }
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              toolbarHeight: appBarHeight,
              backgroundColor: AppColors.primaryColor,
              flexibleSpace: ListTile(
                minTileHeight: 0,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                horizontalTitleGap: 12,
                contentPadding: EdgeInsets.only(left: 20, right: 20, top: 62),
                dense: true,
                leading: GestureDetector(
                  onTap: () => key.currentState!.openDrawer(),
                  child: SvgPicture.asset(
                    Strings.drawerIcon,
                  ),
                ),
                title: Text(
                  "YOUR GUIDE TO",
                  style: interBold.copyWith(fontSize: 25, color: AppColors.whiteColor),
                ),
                trailing: GestureDetector(
                  onTap:
                      () => Navigator.pushNamed(context, MyEventView.id),
                  child: SvgPicture.asset(
                    Strings.bookmarkOutlineIcon,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.only(top: 24.23, left: 20, bottom: 21),
              color: AppColors.secondaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    Strings.appLogo,
                    width: 136,
                    height: 63,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 14),
                  Text(
                    "Third Karachi Biennale",
                    style: interRegular.copyWith(fontSize: 20),
                  ),
                  Text(
                    "Pakistan’s largest international\ncontemporary art event",
                    style: interRegular.copyWith(fontSize: 15),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "31 October - 13 November 2022",
                    style: interBlack.copyWith(fontSize: 20, color: AppColors.primaryColor)
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: 380,
            left: 20,
            right: 20,
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 165 / 120,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: items[index].onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkBackground,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            items[index].image,
                          ),
                          SizedBox(height: 4),
                          Text(
                            items[index].text,
                            style: interBold,
                          ),
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
    );
  }
}

class GridItems {
  String text;
  String image;
  GestureTapCallback onTap;

  GridItems({required this.text, required this.image, required this.onTap});
}
