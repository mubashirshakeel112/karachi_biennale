import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/domain/models/my_event_model.dart';
import 'package:karachi_biennale/presentation/program/controller/program_controller.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      final program = Provider.of<ProgramController>(context, listen: false);
      program.getProgram();
      await program.loadBookmarkedEventIds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.secondaryAppBar(title: 'Programs', context: context),
      body: Consumer<ProgramController>(
        builder: (context, programController, child) {
          return Column(
            children: [
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

// return Container(
//   width: double.infinity,
//   height: 112,
//   padding: EdgeInsets.only(left: 16),
//   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//   decoration: BoxDecoration(
//     border: Border.all(width: 1, color: AppColors.borderColor),
//     shape: BoxShape.rectangle,
//     color: AppColors.whiteColor,
//   ),
//   child: Row(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       SizedBox(
//         // margin: EdgeInsets.only(left: 16, top: 18, bottom: 18),
//         width: 78,
//         height: 76,
//         child: Image.network(program.image, width: 78, height: 76, fit: BoxFit.cover),
//       ),
//       SizedBox(width: 17),
//       Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(program.title, style: interBold),
//           SizedBox(height: 2),
//           Text(program.subtitle, style: interLight.copyWith(fontSize: 15)),
//           SizedBox(height: 4),
//           Row(
//             spacing: 4,
//             children: [
//               SvgPicture.asset(Strings.calenderClockIcon),
//               Text(program.time, style: interLight.copyWith(fontSize: 15)),
//             ],
//           ),
//         ],
//       ),
//       Spacer(),
//       GestureDetector(
//         onTap: () {
//           final myEvent = MyEventModel(
//             image: program.image,
//             title: program.title,
//             subtitle: program.subtitle,
//             time: program.time,
//             id: program.id,
//           );
//           final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
//           programController.toggleBookmark(myEvent, uid, context);
//         },
//         child: Align(
//           alignment: Alignment.bottomRight,
//           child: Container(
//             width: 38,
//             height: 37,
//             decoration: BoxDecoration(color: AppColors.secondaryColor),
//             alignment: Alignment.center,
//             child: SvgPicture.asset(
//               iconAsset,
//               width: 30,
//               height: 25,
//               color: AppColors.textColor,
//             ),
//           ),
//         ),
//       ),
//     ],
//   ),
// );