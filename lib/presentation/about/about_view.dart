import 'package:flutter/material.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/presentation/about/controller/about_controller.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AboutView extends StatefulWidget {
  static const String id = '/about_view';

  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  void initState() {
    super.initState();
    Future.microtask( () {
      Provider.of<AboutController>(context, listen: false).getAbout(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AboutController>(
        builder: (context, aboutController, child) {
          return Column(
            children: [
              SecondaryAppBar(title: 'About',),
              aboutController.isLoading ? Expanded(child: Lottie.asset(Strings.lottieLoadAnim, width: 80, height: 80)): Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: aboutController.aboutData.length,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: Image.network(aboutController.aboutData[index].images[0], height: 226, fit: BoxFit.fill,)),
                            SizedBox(width: 10),
                            Column(
                              children: [
                                Image.network(aboutController.aboutData[index].images[1], height: 101, fit: BoxFit.fill,),
                                SizedBox(height: 7),
                                Image.network(aboutController.aboutData[index].images[2], height: 118, fit: BoxFit.fill,),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 22),
                    Text('About', style: interBold),
                    SizedBox(height: 7),
                    Text('Karachi Biennale (KB) is the flagship project of the KBT that has been designed to use art as a vehicle to discover, discuss and respond to Karachi.', style: interLight),
                    SizedBox(height: 16),
                    Text('The Karachi Biennale Trust (KBT) was founded, in 2016, by a group of art professionals and educators as a platform to promote creativity, innovation and criticality in the visual arts. KBT is a registered Trust and operates as a non-profit organization. KBT works closely with a network of philanthropists and local and international cultural, and educational organizations. It is generously supported by the corporate sector.', style: interLight),
                    SizedBox(height: 16),
                    Text('The Karachi Biennale Trust (KBT) was founded, in 2016, by a group of art professionals and educators as a platform to promote creativity, innovation and criticality in the visual arts. KBT is a registered Trust and operates as a non-profit organization. KBT works closely with a network of philanthropists and local and international cultural, and educational organizations. It is generously supported by the corporate sector.', style: interLight),
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
