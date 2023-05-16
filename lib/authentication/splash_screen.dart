import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymapp/consts/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //creating method to change the screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.offAll(() => const Getstarted());
        } else {
          Get.offAll(() => const ProfileUser());
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
