import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/domain/models/my_event_model.dart';
import 'package:karachi_biennale/presentation/program/controller/program_controller.dart';
import 'package:karachi_biennale/presentation/program/program_detail/program_detail_view.dart';
import 'package:karachi_biennale/presentation/program/program_dropdown/widgets/program_card.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';
import 'package:karachi_biennale/widgets/custom_dropdown.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProgramView extends StatefulWidget {
  static const String id = '/program_view';

  const ProgramView({super.key});

  @override
  State<ProgramView> createState() => _ProgramViewState();
}

class _ProgramViewState extends State<ProgramView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final program = Provider.of<ProgramController>(context, listen: false);
      program.getProgram();
      await program.loadBookmarkedEventIds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProgramController>(
        builder: (context, programController, child) {
          return Column(
            children: [
              SecondaryAppBar(title: 'Programs'),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
                child: CustomDropdown(items: ['2nd November'], onChange: () {}, hintText: '2nd November'),
              ),
              Expanded(
                child:
                    programController.isLoading
                        ? Center(child: Lottie.asset(Strings.lottieLoadAnim, width: 80, height: 80))
                        : ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          itemCount: programController.programData.length,
                          itemBuilder: (context, index) {
                            final program = programController.programData[index];
                            final isBookmarked = programController.bookmarkedEventIds.contains(program.id);
                            final iconAsset = isBookmarked ? Strings.bookmarkFilledIcon : Strings.bookmarkOutlineIcon;
                            return ProgramCard(
                              title: program.title,
                              subtitle: program.subtitle,
                              leadingImage: program.image,
                              time: program.time,
                              bookmarkIcon: iconAsset,
                              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              onTap: () {
                                Navigator.pushNamed(context, ProgramDetailView.id, arguments: program.id);
                              },
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
              ),
            ],
          );
        },
      ),
    );
  }
}
