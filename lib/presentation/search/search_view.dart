import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/domain/models/my_event_model.dart';
import 'package:karachi_biennale/presentation/artist/artist_view.dart';
import 'package:karachi_biennale/presentation/artist/controller/artist_controller.dart';
import 'package:karachi_biennale/presentation/artist/widgets/artist_card.dart';
import 'package:karachi_biennale/presentation/program/controller/program_controller.dart';
import 'package:karachi_biennale/presentation/program/program_dropdown/program_view.dart';
import 'package:karachi_biennale/presentation/program/program_dropdown/widgets/program_card.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';
import 'package:karachi_biennale/widgets/custom_dialog_box.dart';
import 'package:karachi_biennale/widgets/custom_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  static const String id = '/search_view';

  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      Provider.of<ArtistController>(context, listen: false).getArtistAndVotes();
      final program = Provider.of<ProgramController>(context, listen: false);
      program.getProgram();
      await program.loadBookmarkedEventIds();
    });
  }

@override
  Widget build(BuildContext context) {
    final artistController = Provider.of<ArtistController>(context);
    final programController = Provider.of<ProgramController>(context);
    return Scaffold(
      body: Column(
        children: [
          SecondaryAppBar(title: 'Search',),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
            child: CustomTextField(
              hintText: 'Search venue by name',
              filled: true,
              fillColor: AppColors.offWhiteColor,
              isSuffixIconShow: true,
              suffixIcon: SvgPicture.asset(Strings.searchIcon, width: 25, height: 25),
              borderSide: BorderSide.none,
              onChanged: (value) {
                artistController.filterArtists(value);
                programController.filterPrograms(value);
              },
            ),
          ),
          Expanded(
            child: artistController.isLoading || programController.isLoading
                ? Center(child: Lottie.asset(Strings.lottieLoadAnim, width: 80, height: 80))
                : Builder(
              builder: (context) {
                final hasArtists = artistController.artistData.isNotEmpty;
                final hasPrograms = programController.filteredProgramData.isNotEmpty;

                if (!hasArtists && !hasPrograms) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SvgPicture.asset(Strings.crossIcon, height: 80),
                        Icon(Icons.search_off_outlined, size: 80, color: AppColors.textColor,),
                        SizedBox(height: 12),
                        Text("No results found", style: interRegular),
                      ],
                    ),
                  );
                }

                return ListView(
                  padding: const EdgeInsets.only(left: 20, right: 16, top: 26, bottom: 19),
                  children: [
                    if (hasArtists) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Artist", style: interBold),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, ArtistView.id);
                            },
                            child: SvgPicture.asset(Strings.chevronArrow),
                          ),
                        ],
                      ),
                      SizedBox(height: 29),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: artistController.artistData.length >= 2 ? 2 : artistController.artistData.length,
                        itemBuilder: (context, index) {
                          final artist = artistController.artistData[index];
                          final isVoted = artistController.votedArtistIds.contains(artist.id);
                          final isUnvoted = artistController.unvotedArtistIds.contains(artist.id);
                          return ArtistCard(
                            title: artist.name,
                            subtitle: artist.skill,
                            leadingImage: artist.imageUrl,
                            margin: EdgeInsets.only(bottom: 20),
                            isVoted: isVoted,
                            isUnvoted: isUnvoted,
                            onVote: () {
                              final userId = FirebaseAuth.instance.currentUser!.uid;
                              final isAlreadyVoted = artistController.votedArtistIds.contains(artist.id);
                              DialogBox.showDialogBox(
                                context: context,
                                isVote: isVoted,
                                onPressed: () {
                                  if (isAlreadyVoted) {
                                    artistController.unvote(userId, artist.id);
                                  } else {
                                    artistController.vote(userId, artist.id);
                                  }
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                    if (hasPrograms) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Programs", style: interBold),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, ProgramView.id);
                            },
                            child: SvgPicture.asset(Strings.chevronArrow, width: 20, height: 20),
                          ),
                        ],
                      ),
                      SizedBox(height: 29),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: programController.filteredProgramData.length >= 2 ? 2 : programController.filteredProgramData.length,
                        itemBuilder: (context, index) {
                          final program = programController.filteredProgramData[index];
                          final isBookmarked = programController.bookmarkedEventIds.contains(program.id);
                          final iconAsset = isBookmarked ? Strings.bookmarkFilledIcon : Strings.bookmarkOutlineIcon;
                          return ProgramCard(
                            margin: EdgeInsets.only(bottom: 20),
                            title: program.title,
                            subtitle: program.subtitle,
                            leadingImage: program.image,
                            calenderIcon: Strings.calenderClockIcon,
                            time: program.time,
                            bookmarkIcon: iconAsset,
                            onBookmarkedPressed: () {
                              final myEvent = MyEventModel(
                                image: program.image,
                                title: program.title,
                                subtitle: program.subtitle,
                                time: program.time,
                                id: program.id,
                              );
                              final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
                              programController.toggleBookmark(myEvent, uid, context);
                            },
                          );
                        },
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
