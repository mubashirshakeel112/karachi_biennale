import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/domain/models/my_event_model.dart';
import 'package:karachi_biennale/presentation/event/controller/my_event_controller.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';
import 'package:karachi_biennale/widgets/custom_card.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyEventView extends StatefulWidget {
  static const String id = '/my_event_view';

  const MyEventView({super.key});

  @override
  State<MyEventView> createState() => _MyEventViewState();
}

class _MyEventViewState extends State<MyEventView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MyEventController>(context, listen: false).getMyEvent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MyEventController>(
        builder: (context, myEventController, child) {
          return Column(
            children: [
              SecondaryAppBar(title: 'My Events'),
              Expanded(
                child:
                    myEventController.isLoading
                        ? Center(child: Lottie.asset(Strings.lottieLoadAnim, width: 80, height: 80))
                        : ListView.builder(
                          padding: EdgeInsets.only(left: 20, right: 25, top: 30),
                          itemCount: myEventController.myEventData.length,
                          itemBuilder: (context, index) {
                            MyEventModel myEvent = myEventController.myEventData[index];
                            return CustomCard(
                              margin: EdgeInsets.only(bottom: 20),
                              leadingImage: myEvent.image,
                              title: myEvent.title,
                              subtitle: myEvent.subtitle,
                              time: myEvent.time,
                              trailing: GestureDetector(
                                onTap: () {
                                  final myEventId = myEvent.id;
                                  final uid = FirebaseAuth.instance.currentUser?.uid ?? '';
                                  myEventController.deleteEvent(myEventId, uid, context);
                                },
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    width: 38,
                                    height: 37,
                                    alignment: Alignment.center,
                                    color: AppColors.danger,
                                    child: SvgPicture.asset(Strings.deleteIcon),
                                  ),
                                ),
                              ),
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
