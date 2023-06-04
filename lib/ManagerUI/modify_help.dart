import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gymapp/consts/consts.dart';
import '../controlllers/contact_controller.dart';
import 'modify_about.dart';

class ModifyHelp extends StatefulWidget {
  @override
  _ModifyHelpState createState() => _ModifyHelpState();
}

class _ModifyHelpState extends State<ModifyHelp> {
  final _userStream =
      FirebaseFirestore.instance.collection('contact').snapshots();
  TextEditingController facebookController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ContactController());

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
            facebookController.text = docs['facebook'];
            emailController.text = docs['email'];
            phoneNumberController.text = docs['phoneNumber'];
            return SafeArea(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/modify about background.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
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
                              Get.back();
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Modify Contact Us",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              letterSpacing: 1.3,
                            ),
                          ),
                          Icon(
                            Icons.help,
                            size: 30,
                            color: Color(0xFFFD372A),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 170,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 20),
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: 'number',
                            suffixIcon: const Icon(
                              Icons.call,
                              color: Colors.black,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 6.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          style: const TextStyle(fontSize: 20),
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: 'Email',
                            suffixIcon: const Icon(
                              Icons.mail,
                              color: Colors.black,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 6.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          style: const TextStyle(fontSize: 20),
                          controller: facebookController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: 'Facebook Acount',
                            suffixIcon: const Icon(
                              Icons.facebook,
                              color: Colors.black,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 6.0),
                          ),
                        ),
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          15.widthBox,
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ModifyAbout());
                            },
                            child: Container(
                              height: 60,
                              width: 160,
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Modify About ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  Icon(Icons.info,
                                      size: 28, color: Color(0xFF252525)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 140,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFFD372A),
                              ),
                              onPressed: () async {
                                await controller.updateContact(
                                  facebook: facebookController.text,
                                  email: emailController.text,
                                  phoneNumber: phoneNumberController.text,
                                );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save ',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          15.widthBox,
                        ],
                      ),
                      const SizedBox(height: 10.0)
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
