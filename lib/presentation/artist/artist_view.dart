import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/presentation/artist/controller/artist_controller.dart';
import 'package:karachi_biennale/presentation/artist/widgets/artist_card.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';
import 'package:karachi_biennale/widgets/custom_dialog_box.dart';
import 'package:karachi_biennale/widgets/custom_snack_bar.dart';
import 'package:karachi_biennale/widgets/custom_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ArtistView extends StatefulWidget {
  static const String id = '/artist_view';

  const ArtistView({super.key});

  @override
  State<ArtistView> createState() => _ArtistViewState();
}

class _ArtistViewState extends State<ArtistView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ArtistController>(context, listen: false);
      provider.getArtistAndVotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ArtistController>(
        builder: (context, artistController, child) {
          return Column(
            children: [
              SecondaryAppBar(title: 'Artist'),
              CustomTextField(
                hintText: 'Search venue by name',
                filled: true,
                fillColor: AppColors.offWhiteColor,
                borderSide: BorderSide.none,
                isSuffixIconShow: true,
                suffixIcon: SvgPicture.asset(Strings.searchIcon, width: 25, height: 25),
                margin: EdgeInsets.only(left: 20, right: 20, top: 24),
                onChanged: (value) {
                  artistController.filterArtists(value);
                },
              ),
              Expanded(
                child:
                    artistController.isLoading
                        ? Center(child: Lottie.asset(Strings.lottieLoadAnim, width: 80, height: 80))
                        : artistController.artistData.isEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search_off_outlined, size: 80, color: AppColors.textColor),
                              Text('No artists found for "${artistController.searchQuery}"', style: interRegular),
                            ],
                          ),
                        )
                        : ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          itemCount: artistController.artistData.length,
                          itemBuilder: (context, index) {
                            final artist = artistController.artistData[index];
                            final isVoted = artistController.votedArtistIds.contains(artist.id);
                            final isUnvoted = artistController.unvotedArtistIds.contains(artist.id);
                            return ArtistCard(
                              title: artist.name,
                              subtitle: artist.skill,
                              leadingImage: artist.imageUrl,
                              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                      CustomSnackBar.successSnackBar(
                                        context: context,
                                        title: 'Success',
                                        message: 'UnVote Successfully',
                                      );
                                      Navigator.pop(context);
                                    } else {
                                      artistController.vote(userId, artist.id);
                                      CustomSnackBar.successSnackBar(
                                        context: context,
                                        title: 'Success',
                                        message: 'Add Vote Successfully',
                                      );
                                      Navigator.pop(context);
                                    }
                                  },
                                );
                              },
                            );
                          },
                        ),
              ),
            ],
          );
        },
      ),
    );
  }
}
