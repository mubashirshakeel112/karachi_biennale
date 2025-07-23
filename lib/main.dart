import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karachi_biennale/base/app_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(AppView());
}