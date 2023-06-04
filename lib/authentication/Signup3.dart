import 'package:custom_check_box/custom_check_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymapp/common_widgets/my_textformfield.dart';
import 'package:gymapp/consts/firebase_consts.dart';
import 'package:gymapp/consts/Colors.dart';
import 'package:gymapp/controlllers/auth_controller.dart';
import '../UserUI/home.dart';

class Signup3 extends StatefulWidget {
  const Signup3({super.key});

  @override
  State<Signup3> createState() => _Signup3State();
}

class _Signup3State extends State<Signup3> {
  bool shouldCheck = false;
  var controller = Get.put(AuthController());
  //text controllers
  var fullNameController = Get.arguments[0];
  var usernameController = Get.arguments[1];
  var phoneNumberController = Get.arguments[2];
  var ageController = Get.arguments[3];
  var weightController = Get.arguments[4];
  var heightController = Get.arguments[5];

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Obx(
      () => Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
          height: screenlength,
          width: screenwidth,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/5.jpg",
                  ),
                  fit: BoxFit.fill)),
          child: ListView(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Color(0xFFFF1E0F),
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              myTextformfield(
                hint: "Email",
                type: TextInputType.emailAddress,
                controller: emailController,
              ),
              myTextformfield(
                hint: "Password",
                obsecure: _isPasswordVisible,
                type: TextInputType.visiblePassword,
                controller: passwordController,
                icon: IconButton(
                  icon: Icon(
                    !_isPasswordVisible
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
              ),
              myTextformfield(
                hint: "Confirm Password",
                obsecure: _isPasswordVisible,
                type: TextInputType.visiblePassword,
                controller: confirmPasswordController,
                icon: IconButton(
                  icon: Icon(
                    !_isPasswordVisible
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
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomCheckBox(
                      value: shouldCheck,
                      shouldShowBorder: true,
                      borderColor: const Color(0xFFFF1E0F),
                      checkedFillColor: const Color(0xFFFF1E0F),
                      borderRadius: 8,
                      borderWidth: 1,
                      checkBoxSize: 22,
                      onChanged: (val) {
                        setState(() {
                          shouldCheck = val;
                        });
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "You agree to our ",
                            style: TextStyle(color: Color(0xFFFF1E0F)),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              "Termes of Services ",
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          const Text(
                            " and",
                            style: TextStyle(color: Color(0xFFFF1E0F)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Privacy Policy",
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                child: Container(
                  height: 50,
                  width: 100,
                  child: controller.isloading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Color(0xFFFF1E0F)),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            backgroundColor: (emailController.text != "" &&
                                    passwordController.text != "" &&
                                    confirmPasswordController.text != "" &&
                                    shouldCheck)
                                ? const Color(0xFFFF1E0F)
                                : const Color.fromARGB(255, 255, 184, 179),
                          ),
                          onPressed: () async {
                            if (emailController.text != "" &&
                                passwordController.text != "" &&
                                confirmPasswordController.text != "") {
                              if (passwordController.text ==
                                  confirmPasswordController.text) {
                                if (shouldCheck != false) {
                                  controller.isloading(true);
                                  try {
                                    await controller
                                        .signupMethod(
                                      context: context,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    )
                                        .then((value) {
                                      auth
                                          .authStateChanges()
                                          .listen((User? user) {
                                        controller.storeUserData(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          fullName: fullNameController.text,
                                          username: usernameController.text,
                                          phoneNumber:
                                              phoneNumberController.text,
                                          age: ageController.text,
                                          weight: weightController.text,
                                          height: heightController.text,
                                        );
                                      });
                                    }).then((value) {
                                      Get.snackbar(
                                        "Congrats..!",
                                        "Signed up succefully.",
                                        snackPosition: SnackPosition.TOP,
                                        colorText: black,
                                        backgroundColor: white,
                                      );
                                      Get.offAll(() => const HomeView2());
                                    });
                                  } catch (e) {
                                    auth.signOut();
                                    Get.snackbar(
                                      "Oops..!",
                                      "This email is incorrect or existe before .",
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: white,
                                      backgroundColor: red,
                                    );

                                    controller.isloading(false);
                                  }
                                }
                              } else {
                                Get.snackbar(
                                  "Oops..!",
                                  "Please confirm the password correctly.",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: white,
                                  backgroundColor: red,
                                );
                              }
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
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(width: 2, color: const Color(0xFFFF1E0F)),
                      borderRadius: BorderRadius.circular(15)),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      "Back",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFF1E0F)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ))),
      ),
    );
  }
}
