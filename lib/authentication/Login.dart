// ignore_for_file: prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:gymapp/UserUI/Profileuser.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:gymapp/controlllers/auth_controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: screenlength,
            width: screenwidth,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "images/8.jpg",
              ),
              fit: BoxFit.fill,
            )),
            child: Obx(
              () => ListView(
                children: [
                  SizedBox(
                    height: 80,
                  ),

                  Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Color(0xFFFF1E0F),
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  //Email field
                  myTextformfield(
                    hint: "Email",
                    icon: Icon(Icons.email),
                    type: TextInputType.emailAddress,
                    controller: controller.emailController,
                  ),
                  //Password field
                  myTextformfield(
                    hint: "Password",
                    obsecure: true,
                    icon: Icon(Icons.password_sharp),
                    type: TextInputType.visiblePassword,
                    controller: controller.passwordController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You forget your password ?",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          " Get Help",
                          style:
                              TextStyle(color: Color(0xFFFF1E0F), fontSize: 17),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
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
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation(Color(0xFFFF1E0F)),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  backgroundColor: Color(0xFFFF1E0F)),
                              onPressed: () async {
                                controller.isloading(true);
                                await controller
                                    .loginMethod(context: context)
                                    .then((value) {
                                  if (value != null) {
                                    VxToast.show(context,
                                        msg: "Logged in Successfully");
                                    Get.offAll(() => const ProfileUser());
                                  } else {
                                    controller.isloading(false);
                                  }
                                });
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),
                              )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "You don't have an account ? ",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            //Navigator.of(context).pushNamed("Signup1");
                            Get.to(() => Signup1());
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color(0xFFFF1E0F), fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "  Or  ",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
                                fit: BoxFit.fill,

                      Container(
                        height: 1,
                        width: 120,
                        decoration: BoxDecoration(
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
