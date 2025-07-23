import 'package:flutter/animation.dart';

class CardData{
  String title;
  String subtitle;
  String? time;
  String leadingImage;
  Color? trailContColor;

  CardData({required this.title, required this.subtitle, required this.leadingImage, this.time, this.trailContColor});
}