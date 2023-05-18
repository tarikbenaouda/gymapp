import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:gymapp/ManagerUI/CoachProfile.dart';
import 'package:gymapp/ManagerUI/DemandTraining.dart';
import 'package:gymapp/ManagerUI/about.dart';
import 'package:gymapp/ManagerUI/help.dart';
import 'package:gymapp/ManagerUI/help_sending.dart';
import 'package:gymapp/ManagerUI/modify_about.dart';
import 'package:gymapp/ManagerUI/modify_events.dart';
import 'package:gymapp/ManagerUI/modify_help.dart';
import 'package:gymapp/UserUI/CoachInformation.dart';
import 'package:gymapp/UserUI/Profileuser.dart';
import 'package:gymapp/UserUI/SettingsUser.dart';
import 'package:gymapp/UserUI/Test.dart';
import 'package:gymapp/UserUI/about.dart';
import 'package:gymapp/UserUI/calories.dart';
import 'package:gymapp/UserUI/calories_estimate.dart';
import 'package:gymapp/UserUI/home_view.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:gymapp/ManagerUI/listofcoach.dart';
import 'package:gymapp/UserUI/Coaching_demand.dart';

import 'package:gymapp/ManagerUI/listofcoach.dart';
import 'package:gymapp/ManagerUI/ProfileCoachdemand.dart';
import 'package:gymapp/UserUI/Profileuser.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:gymapp/ManagerUI/listofcoach.dart';

import 'package:gymapp/ManagerUI/listofcoach.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFF1E0F),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
