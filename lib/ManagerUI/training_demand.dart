import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../common_widgets/my_textformfield.dart';
import '../controlllers/manager_training_demand_controller.dart';
import '../controlllers/manger_profiles_controller.dart';

class DemandTrainnig extends StatefulWidget {
  const DemandTrainnig({super.key});

  @override
  State<DemandTrainnig> createState() => _DemandTrainnigState();
}

class _DemandTrainnigState extends State<DemandTrainnig> {
  var uid = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ManagerTrainingDemandController());
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
                  // 2.heightBox,
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
                  const Center(
                    child: Text(
                      " Training demand ",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  15.heightBox,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120),
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
                  8.heightBox,
                  Center(
                      child: "${docs['username']}"
                          .text
                          .white
                          .size(20)
                          .bold
                          .make()),
                  10.heightBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 400,
                      width: screenwidth - 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          const Center(
                            child: Text(
                              "Informations Of Athlete ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          MyInfos(
                            Textinput: " FullName ",
                            Textinput2: docs['fullName'],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          MyInfos(
                            Textinput: " Age ",
                            Textinput2: "${docs['age']} Years old",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          MyInfos(
                            Textinput: " Height ",
                            Textinput2: "${docs['height']} cm",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          MyInfos(
                            Textinput: " Weigth ",
                            Textinput2: "${docs['weight']} Kg",
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          MyInfos(
                            Textinput: " Email ",
                            Textinput2: docs['email'],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          MyInfos(
                            Textinput: " Phone Number ",
                            Textinput2: docs['phoneNumber'],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () async {
                              await controller.acceptAthlete(
                                  type: "athlete", training: false, id: uid);
                              Get.back();
                            },
                            child: Container(
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: Text(
                                      " Accepte ",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            )),
                        TextButton(
                            onPressed: () async {
                              await controller.refuseAthlete(
                                  training: false, id: uid);
                              Get.back();
                            },
                            child: Container(
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: Text(
                                      " Refuse ",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.red),
                                    ),
                                  ),
                                  Icon(
                                    Icons.delete_outline_outlined,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ]),
              );
            }
          }),
    );
  }
}
