import 'package:flutter/material.dart';
import 'package:karachi_biennale/constants/strings.dart';
import 'package:karachi_biennale/constants/typography.dart';
import 'package:karachi_biennale/widgets/custom_app_bar.dart';

class AboutView extends StatelessWidget {
  static const String id = '/about_view';

  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SecondaryAppBar(title: 'About'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Image.asset(Strings.aboutImage1, height: 226, fit: BoxFit.fill)),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Image.asset(Strings.aboutImage2, height: 101, fit: BoxFit.fill),
                        SizedBox(height: 7),
                        Image.asset(Strings.aboutImage3, height: 118, fit: BoxFit.fill),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 22),
                Text('About', style: interBold),
                SizedBox(height: 7),
                Text(
                  'Karachi Biennale (KB) is the flagship project of the KBT that has been designed to use art as a vehicle to discover, discuss and respond to Karachi.',
                  style: interLight,
                ),
                SizedBox(height: 16),
                Text(
                  'The Karachi Biennale Trust (KBT) was founded, in 2016, by a group of art professionals and educators as a platform to promote creativity, innovation and criticality in the visual arts. KBT is a registered Trust and operates as a non-profit organization. KBT works closely with a network of philanthropists and local and international cultural, and educational organizations. It is generously supported by the corporate sector.',
                  style: interLight,
                ),
                SizedBox(height: 16),
                Text(
                  'The Karachi Biennale Trust (KBT) was founded, in 2016, by a group of art professionals and educators as a platform to promote creativity, innovation and criticality in the visual arts. KBT is a registered Trust and operates as a non-profit organization. KBT works closely with a network of philanthropists and local and international cultural, and educational organizations. It is generously supported by the corporate sector.',
                  style: interLight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
