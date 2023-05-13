import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:gymapp/ManagerUI/CoachProfile.dart';

import 'package:gymapp/UserUI/CoachInformation.dart';
import 'package:gymapp/UserUI/Profileuser.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:gymapp/ManagerUI/listofcoach.dart';

import 'package:gymapp/ManagerUI/listofcoach.dart';
import 'package:gymapp/ManagerUI/ProfileCoach.dart';
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
      statusBarColor: Color(0xFFFF1E0F), // Set your desired color here
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        //  "/": (context) => Auth(),
        "welcome": (context) => const Unboarding(),
        "Login": (context) => Login(),
        "Signup1": (context) => Signup1(),
        "Signup2": (context) => Signup2(),
        "Signup3": (context) => Signup3(),
        "Profile": (context) => Profileathlete(),
        "ListAthletes": (context) => Listathletes(),
        "ProfileCoachdemand": (context) => ProfileCoach(),
        "Demandcoaching": (context) => DemandForCoaching(),
        "HomePage": (context) => HomeView(),
        //"CoachProfile": (context) =>  CoachProfile(),
      },
    );
  }
}
