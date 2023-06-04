import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymapp/ManagerUI/home2.dart';
import 'package:gymapp/UserUI/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:gymapp/authentication/Getstarted.dart';
import 'package:gymapp/consts/firebase_consts.dart';
import 'package:gymapp/consts/images.dart';
import 'package:gymapp/consts/Colors.dart';
import 'package:gymapp/common_widgets/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //creating method to change the screen
  changeScreen() {
    String uid;
    Future.delayed(const Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.offAll(() => const Getstarted());
        } else {
          uid = auth.currentUser!.uid;
          (uid == "kvqkjI1Jf5ZeJdkhoaJz0qZ7ukL2")
              ? Get.offAll(() => const HomeView1())
              : Get.offAll(() => const HomeView2());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: red,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              ),
            ),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            "gymapp".text.bold.size(22).white.make(),
            5.heightBox,
            "1.0.0".text.white.make(),
            const Spacer(),
            "@esi-sba".text.white.semiBold.make(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}
