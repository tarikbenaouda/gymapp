import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:gymapp/UserUI/Profileuser.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:gymapp/controlllers/auth_controller.dart';

import '../UserUI/home_view.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    String uid;
    var controller = Get.put(AuthController());
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: screenlength,
            width: screenwidth,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "images/8.jpg",
              ),
              fit: BoxFit.fill,
            )),
            child: Obx(
              () => Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),

                  const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Color(0xFFFF1E0F),
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  //Email field
                  myTextformfield(
                    hint: "Email",
                    icon: const Icon(Icons.email),
                    type: TextInputType.emailAddress,
                    controller: controller.emailController,
                  ),
                  //Password field
                  myTextformfield(
                    hint: "Password",
                    obsecure: true,
                    icon: const Icon(Icons.password_sharp),
                    type: TextInputType.visiblePassword,
                    controller: controller.passwordController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "You forget your password ?",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          " Get Help",
                          style:
                              TextStyle(color: Color(0xFFFF1E0F), fontSize: 17),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //Login button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 20),
                    child: Container(
                      width: 122,
                      height: 60,
                      child: controller.isloading.value
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation(Color(0xFFFF1E0F)),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  backgroundColor: const Color(0xFFFF1E0F)),
                              onPressed: () async {
                                if (controller.emailController.text != "" &&
                                    controller.passwordController.text != "") {
                                  controller.isloading(true);
                                  await controller
                                      .loginMethod(context: context)
                                      .then((value) {
                                    auth
                                        .authStateChanges()
                                        .listen((User? user) {
                                      if (value != null) {
                                        VxToast.show(context,
                                            msg: "Logged in Successfully");
                                        auth.authStateChanges();
                                        uid = auth.currentUser!.uid;
                                        (uid == "kvqkjI1Jf5ZeJdkhoaJz0qZ7ukL2")
                                            ? Get.offAll(() => const HomeView())
                                            : Get.offAll(
                                                () => const HomeViewAthlete());
                                      } else {
                                        controller.isloading(false);
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const AlertDialog(
                                              backgroundColor:
                                                  const Color(0xFF4F4F4F),
                                              title: Text(
                                                "Error",
                                                style: TextStyle(color: white),
                                              ),
                                              content: Text(
                                                  "Oops! Email or Password incorrect.",
                                                  style:
                                                      TextStyle(color: white)),
                                            );
                                          },
                                        );
                                      }
                                    });
                                  });
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertDialog(
                                        backgroundColor:
                                            const Color(0xFF4F4F4F),
                                        title: Text(
                                          "Error",
                                          style: TextStyle(color: white),
                                        ),
                                        content: Text(
                                            "Oops! The Fields are empty.",
                                            style: TextStyle(color: white)),
                                      );
                                    },
                                  );
                                }
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        const Text(
                          "You don't have an account ? ",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const Signup1());
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color(0xFFFF1E0F), fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "  Or  ",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Container(
                        height: 1,
                        width: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        2,
                        (index) => Padding(
                              padding: const EdgeInsets.all(12),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: Image.asset(
                                  socialIconList[index],
                                  width: 30,
                                ),
                              ),
                            )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
