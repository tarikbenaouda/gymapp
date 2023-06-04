import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controlllers/about_controller.dart';

class ModifyAbout extends StatefulWidget {
  @override
  _ModifyAboutState createState() => _ModifyAboutState();
}

class _ModifyAboutState extends State<ModifyAbout> {
  final _userStream =
      FirebaseFirestore.instance.collection('about').snapshots();
  TextEditingController _aboutTheGymContoller = TextEditingController();
  TextEditingController _aboutTheAppController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AboutController());
    return Scaffold(
      body: StreamBuilder(
          stream: _userStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Connection error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            var docs = snapshot.data!.docs[0];
            _aboutTheGymContoller.text = docs['aboutTheGym'];
            _aboutTheAppController.text = docs['aboutTheApp'];

            return SafeArea(
              child: Container(
                height: (MediaQuery.of(context).size.height),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/modify about background.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.keyboard_double_arrow_left_outlined,
                            size: 37,
                            color: Color(0xFFFD372A),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child: Text(
                              "Modify About ",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                letterSpacing: 1.3,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: Icon(
                            Icons.info,
                            size: 30,
                            color: Color(0xFFFD372A),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 670,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              "images/help and about mini background.jpg"),
                          fit: BoxFit.fill,
                        ),
                        color: const Color(0xFF4F4F4F),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'About The Gym :',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              cursorColor: const Color(0xFFFD372A),
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontSize: 22),
                              scrollPhysics: const ScrollPhysics(),
                              maxLines: 3,
                              textAlignVertical: TextAlignVertical.top,
                              controller: _aboutTheGymContoller,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFD372A),
                                  ),
                                ),
                                alignLabelWithHint: true,
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFFD372A),
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'About The App :',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              cursorColor: const Color(0xFFFD372A),
                              style: const TextStyle(fontSize: 22),
                              scrollPhysics: const ScrollPhysics(),
                              maxLines: 3,
                              textAlignVertical: TextAlignVertical.top,
                              controller: _aboutTheAppController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFD372A),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFFD372A),
                              ),
                              onPressed: () async {
                                print(_aboutTheAppController.text);
                                await controller.updateAbout(
                                  aboutTheApp: _aboutTheAppController.text,
                                  aboutTheGym: _aboutTheGymContoller.text,
                                );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save ',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
