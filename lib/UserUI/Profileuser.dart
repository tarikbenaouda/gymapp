import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/common_widgets/my_textformfield.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:gymapp/controlllers/profile_controller.dart';

import '../services/firestore_services.dart';
import 'SettingsUser.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
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
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.keyboard_double_arrow_left_outlined,
                            color: Color(0xFFFF1E0F),
                            size: 35,
                          ),
                          SizedBox(
                            width: 85,
                          ),
                          Center(
                            child: Text(
                              " Profile",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 550,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                              "images/21.jpg",
                            ),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(20)),
                    child: ListView(children: [
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Row(
                          children: [
                            data['imageUrl'] == ''
                                ? Image.asset(
                                    icGoogleLogo,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make()
                                : Image.network(
                                    data['imageUrl'],
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              children: [
                                TextButton(
                                    onPressed: () async {
                                      if (data['type'] == "athlete" ||
                                          data['type'] == "coach") {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor:
                                                  const Color(0xFF4F4F4F),
                                              title: const Center(
                                                child: Text(
                                                  "Oops!",
                                                  style:
                                                      TextStyle(color: white),
                                                ),
                                              ),
                                              content: Center(
                                                child: Text(
                                                    "You're already a ${data['type']}.",
                                                    style: const TextStyle(
                                                        color: white)),
                                              ),
                                            );
                                          },
                                        );
                                      } else if (data['training']) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const AlertDialog(
                                              backgroundColor:
                                                  Color(0xFF4F4F4F),
                                              title: Center(
                                                child: Text(
                                                  "Pending..!",
                                                  style:
                                                      TextStyle(color: white),
                                                ),
                                              ),
                                              content: Center(
                                                child: Text(
                                                    " You have sent demand",
                                                    style: TextStyle(
                                                        color: white)),
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        controller.sendDemand(
                                          training: true,
                                        );
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const AlertDialog(
                                              backgroundColor:
                                                  Color(0xFF4F4F4F),
                                              title: Center(
                                                child: Text(
                                                  "Done !",
                                                  style:
                                                      TextStyle(color: white),
                                                ),
                                              ),
                                              content: Center(
                                                child: Text(
                                                    " The demand have been sent",
                                                    style: TextStyle(
                                                        color: white)),
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFE6E6E6),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Send Demand Training",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13),
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
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFE6E6E6),
                                    borderRadius: BorderRadius.circular(20)),
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
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFE6E6E6),
                                    borderRadius: BorderRadius.circular(20)),
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
                      MyInfos(
                        Textinput: "UserName",
                        Textinput2: "${data['username']}",
                      ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: ourButton(
                          color: red,
                          title: "Edit",
                          textColor: white,
                          onPress: () {
                            controller.fullNameController.text =
                                data['fullName'];
                            controller.usernameController.text =
                                data['username'];
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
                    ]),
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
