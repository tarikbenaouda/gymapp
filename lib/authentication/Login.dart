import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymapp/ManagerUI/home2.dart';
import 'package:gymapp/UserUI/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:gymapp/authentication/Signup1.dart';
import 'package:gymapp/common_widgets/my_textformfield.dart';
import 'package:gymapp/consts/firebase_consts.dart';
import 'package:gymapp/consts/Colors.dart';
import 'package:gymapp/controlllers/auth_controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

bool _isPasswordVisible = false;

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
                    height: 130,
                  ),
                  //Email field
                  myTextformfield(
                    hint: "Email",
                    icon: const Icon(
                      Icons.email,
                      color: Color(0xFFFF1E0F),
                    ),
                    type: TextInputType.emailAddress,
                    controller: controller.emailController,
                  ),
                  //Password field
                  myTextformfield(
                    hint: "Password",
                    obsecure: !_isPasswordVisible,
                    icon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: red,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
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
                                backgroundColor: (controller
                                                .emailController.text !=
                                            "" &&
                                        controller.passwordController.text !=
                                            "")
                                    ? const Color(0xFFFF1E0F)
                                    : const Color.fromARGB(255, 255, 184, 179),
                              ),
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
                                        auth.authStateChanges();
                                        uid = auth.currentUser!.uid;
                                        if (uid ==
                                            "kvqkjI1Jf5ZeJdkhoaJz0qZ7ukL2") {
                                          Get.offAll(() => const HomeView1());
                                          Get.snackbar(
                                            "Congrats..!",
                                            "Logged in succefully.",
                                            snackPosition: SnackPosition.TOP,
                                            colorText: black,
                                            backgroundColor: white,
                                          );
                                        } else {
                                          Get.offAll(() => const HomeView2());
                                          Get.snackbar(
                                            "Congrats..!",
                                            "Logged in succefully.",
                                            snackPosition: SnackPosition.TOP,
                                            colorText: black,
                                            backgroundColor: white,
                                          );
                                        }
                                      } else {
                                        controller.isloading(false);
                                        Get.snackbar(
                                          "Oops..!",
                                          "Email or Password incorrect.",
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: white,
                                          backgroundColor: red,
                                        );
                                      }
                                    });
                                  });
                                } else {
                                  Get.snackbar(
                                    "Oops..!",
                                    "Please fill all the fields.",
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: white,
                                    backgroundColor: red,
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
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const Signup1());
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color(0xFFFF1E0F),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  10.heightBox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
