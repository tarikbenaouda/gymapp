// ignore_for_file: prefer_const_constructors

import 'package:custom_check_box/custom_check_box.dart';
import 'package:gymapp/UserUI/Profileuser.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:gymapp/controlllers/auth_controller.dart';

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
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/5.jpg",
                  ),
                  fit: BoxFit.fill)),
          child: ListView(
            children: [
              SizedBox(
                height: 80,
              ),
              Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Color(0xFFFF1E0F),
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              myTextformfield(
                hint: "Email",
                type: TextInputType.emailAddress,
                controller: emailController,
              ),
              myTextformfield(
                hint: "Password",
                obsecure: true,
                type: TextInputType.visiblePassword,
                controller: passwordController,
              ),
              myTextformfield(
                hint: "Confirm Password",
                obsecure: true,
                type: TextInputType.visiblePassword,
                controller: confirmPasswordController,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: CustomCheckBox(
                      value: shouldCheck,
                      shouldShowBorder: true,
                      borderColor: Color(0xFFFF1E0F),
                      checkedFillColor: Color(0xFFFF1E0F),
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
                          Text(
                            "You agree to our ",
                            style: TextStyle(color: Color(0xFFFF1E0F)),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Termes of Services ",
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          Text(
                            " and",
                            style: TextStyle(color: Color(0xFFFF1E0F)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
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
                            backgroundColor: shouldCheck == true
                                ? Color(0xFFFF1E0F)
                                : Color.fromARGB(255, 255, 184, 179),
                          ),
                          onPressed: () async {
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
                                    return controller.storeUserData(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      fullName: fullNameController.text,
                                      username: usernameController.text,
                                      phoneNumber: phoneNumberController.text,
                                      age: ageController.text,
                                      weight: weightController.text,
                                      height: heightController.text,
                                    );
                                  }).then((value) {
                                    VxToast.show(context,
                                        msg: "Logged in successfully");
                                    Get.offAll(() => ProfileUser());
                                  });
                                } catch (e) {
                                  auth.signOut();
                                  VxToast.show(context, msg: e.toString());
                                  controller.isloading(false);
                                }
                              }
                            } else {
                              VxToast.show(context,
                                  msg: "Confirm password error");
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(
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
                      border: Border.all(width: 2, color: Color(0xFFFF1E0F)),
                      borderRadius: BorderRadius.circular(15)),
                  child: InkWell(
                    onTap: () {
                      //Navigator.of(context).pushNamed("Signup2");
                      //Get.to(() => Signup2());
                      Get.back();
                    },
                    child: Text(
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
