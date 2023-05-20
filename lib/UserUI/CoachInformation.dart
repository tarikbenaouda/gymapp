import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../common_widgets/my_textformfield.dart';
import '../controlllers/manager_training_demand_controller.dart';
import '../controlllers/manger_coaching_demand_controller.dart';
import '../controlllers/manger_profiles_controller.dart';

class CoachInformation extends StatefulWidget {
  const CoachInformation({super.key});

  @override
  State<CoachInformation> createState() => _CoachInformationState();
}

class _CoachInformationState extends State<CoachInformation> {
  var uid = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ManagerCoachingDemandController());
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      body: StreamBuilder(
          stream: FirestoreServices.getUser(uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Connection error");
            }
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(red)));
            } else {
              var docs = snapshot.data!.docs[0];

              return Container(
                height: screenlength,
                width: screenwidth,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/16.jpg"), fit: BoxFit.fill)),
                child: ListView(children: [
                  2.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 0, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.keyboard_double_arrow_left_outlined,
                            color: Colors.red,
                            size: 35,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        docs['fullName'],
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        " Coach ",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 223, 222, 222),
                        ),
                      ),
                    ],
                  ),
                  15.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 130),
                    child: docs['imageUrl'] == ''
                        ? Image.asset(
                            icGoogleLogo,
                            width: 60,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.network(
                            docs['imageUrl'],
                            width: 60,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                  ),
                  5.heightBox,
                  Center(
                      child: "${docs['username']}"
                          .text
                          .white
                          .size(20)
                          .bold
                          .make()),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        10.heightBox,
                        MyInfos(
                          Textinput: " Age ",
                          Textinput2: "${docs['age']} Years old",
                        ),
                        10.heightBox,
                        MyInfos(
                          Textinput: " Height ",
                          Textinput2: "${docs['height']} cm",
                        ),
                        10.heightBox,
                        MyInfos(
                          Textinput: " Weigth ",
                          Textinput2: "${docs['weight']} Kg",
                        ),
                        10.heightBox,
                        MyInfos(
                          Textinput: " Email ",
                          Textinput2: docs['email'],
                        ),
                        10.heightBox,
                        MyInfos(
                          Textinput: " Phone Number ",
                          Textinput2: docs['phoneNumber'],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              );
            }
          }),
    );
  }
}
