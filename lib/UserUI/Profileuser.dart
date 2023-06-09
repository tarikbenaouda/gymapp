import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/common_widgets/my_textformfield.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:gymapp/consts/firebase_consts.dart';
import 'package:gymapp/consts/images.dart';
import 'package:gymapp/consts/Colors.dart';
import 'package:gymapp/common_widgets/our_button.dart';
import 'package:gymapp/controlllers/profile_controller.dart';
import 'package:gymapp/services/firestore_services.dart';
import 'package:gymapp/UserUI/SettingsUser.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    var controller = Get.put(ProfileController());

    return Scaffold(
      body: StreamBuilder(
        stream: FirestoreServices.getUser(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(red),
              ),
            );
          } else {
            var data = snapshot.data!.docs[0];
            return Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/20.jpg"), fit: BoxFit.cover)),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " Profile ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.person,
                          size: 35,
                          color: Color(0xFFFF1E0F),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        data['imageUrl'] == ''
                            ? Image.asset(
                                icGoogleLogo,
                                width: 120,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make()
                            : Image.network(
                                data['imageUrl'],
                                width: 120,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make(),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      "${data['username']}",
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 45,
                            width: 150,
                            decoration: BoxDecoration(
                                color: const Color(0xFFE6E6E6),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Center(
                                  child: Text(
                                    'Height:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF252525),
                                        fontSize: 20),
                                  ),
                                ),
                                Text("${data['height']} cm")
                              ],
                            )),
                        const SizedBox(
                          width: 7,
                        ),
                        Container(
                            height: 45,
                            width: 150,
                            decoration: BoxDecoration(
                                color: const Color(0xFFE6E6E6),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Center(
                                  child: Text(
                                    'Weight:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF252525),
                                        fontSize: 20),
                                  ),
                                ),
                                Text("${data['weight']} Kg")
                              ],
                            )),
                      ],
                    ),
                  ),
                  4.heightBox,
                  MyInfos(
                    Textinput: "age",
                    Textinput2: "${data['age']} yo",
                  ),
                  4.heightBox,
                  MyInfos(
                    Textinput: "FullName",
                    Textinput2: "${data['fullName']}",
                  ),
                  4.heightBox,
                  4.heightBox,
                  MyInfos(
                    Textinput: "Email",
                    Textinput2: "${data['email']}",
                  ),
                  4.heightBox,
                  MyInfos(
                    Textinput: "Phone Number",
                    Textinput2: "${data['phoneNumber']}",
                  ),
                  TextButton(
                      onPressed: () async {
                        if (data['type'] == "athlete" ||
                            data['type'] == "coach") {
                          Get.snackbar(
                            "Oops!",
                            "You're already a ${data['type']}.",
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: white,
                          );
                        } else if (data['training']) {
                          Get.snackbar(
                            "Pending..!",
                            "You have already sent a demand",
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: white,
                          );
                        } else {
                          controller.sendDemand(
                            training: true,
                          );
                          Get.snackbar(
                            "Done..!",
                            "The demand has been sent.",
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: white,
                          );
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                            color: const Color(0xFFE6E6E6),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              " Send Demand Training",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.send,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: ourButton(
                      color: red,
                      title: "Edit",
                      textColor: white,
                      onPress: () {
                        controller.fullNameController.text = data['fullName'];
                        controller.usernameController.text = data['username'];
                        controller.phoneNumberController.text =
                            data['phoneNumber'];
                        controller.ageController.text = data['age'];
                        controller.heightController.text = data['height'];
                        controller.weightController.text = data['weight'];
                        //controller.passwordController.text =
                        //    data['password'];
                        Get.to(
                          () => SettingsUser(data: data),
                        );
                      },
                    ).box.rounded.width(context.screenWidth - 70).make(),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
