import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:gymapp/controlllers/auth_controller.dart';
import 'package:gymapp/controlllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "You are at Home!".text.size(22).black.bold.make(),
                40.heightBox,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 2),
                  child: Container(
                    height: 60,
                    width: 140,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: const Color(0xFFFF1E0F),
                      ),
                      onPressed: () async {
                        await Get.put(AuthController()).signoutMethod(context);
                        Get.offAll(() => const Login());
                      },
                      child: const Text(
                        "Sign Out",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
            .box
            .white
            .width(context.screenWidth)
            .height(context.screenHeight)
            .make(),
      ),
    );
  }
}
