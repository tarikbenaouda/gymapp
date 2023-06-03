import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/common_widgets/my_textformfield.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:gymapp/controlllers/profile_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../services/firestore_services.dart';
import 'SettingsUser.dart';
import 'home_view.dart';

class UserQrCode extends StatefulWidget {
  const UserQrCode({super.key});

  @override
  State<UserQrCode> createState() => _UserQrCodeState();
}

class _UserQrCodeState extends State<UserQrCode> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    // var controller = Get.put(ProfileController());

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
                    height: 30,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          child: Icon(
                            Icons.keyboard_double_arrow_left_outlined,
                            color: Color(0xFFFF1E0F),
                            size: 50,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Text(
                        " My code ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      const Icon(
                        Icons.qr_code,
                        size: 35,
                        color: Color(0xFFFF1E0F),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: QrImageView(
                        data: data['code'].toString(),
                        size: 250.0,
                        version: QrVersions.auto,
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
