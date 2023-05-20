import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymapp/ManagerUI/home_page.dart';
import 'ProfileCoach.dart';
import '../consts/consts.dart';
import 'CoachProfile.dart';

class listofcoachs extends StatefulWidget {
  const listofcoachs({super.key});

  @override
  State<listofcoachs> createState() => _listofcoachsState();
}

class _listofcoachsState extends State<listofcoachs> {
  final _userStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      body: StreamBuilder(
          stream: _userStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Connection error");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            var docs = snapshot.data!.docs;
            int count = 0;
            List<int> athletes = <int>[];
            for (int i = 0; i < docs.length; i++) {
              if (docs[i]['type'] == "coach") {
                count++;
                athletes.add(i);
              }
            }
            return Container(
              height: screenlength,
              width: screenwidth,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/16.jpg"), fit: BoxFit.fill)),
              child: ListView(
                children: [
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
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      //drawer
                      Text(
                        "Our coachs",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [],
                  ),
                  Container(
                    width: double.infinity,
                    height: 550,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 22, 22, 22),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "coachs List",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Icon(
                                Icons.person_outline,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                            child: ListView.builder(
                                itemCount: count,
                                itemBuilder: ((context, index) {
                                  return InkWell(
                                      onTap: () {
                                        Get.to(
                                          () => const ProfileCoach(),
                                          arguments: [
                                            docs[athletes[index]]['id'],
                                          ],
                                        );
                                      },
                                      child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          width: (double.infinity) - 40,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFE6E6E6),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: ListTile(
                                            leading: docs[athletes[index]]
                                                        ['imageUrl'] ==
                                                    ''
                                                ? Image.asset(
                                                    icGoogleLogo,
                                                    width: 37,
                                                    fit: BoxFit.cover,
                                                  )
                                                    .box
                                                    .roundedFull
                                                    .clip(Clip.antiAlias)
                                                    .make()
                                                : Image.network(
                                                    docs[athletes[index]]
                                                        ['imageUrl'],
                                                    width: 37,
                                                    fit: BoxFit.cover,
                                                  )
                                                    .box
                                                    .roundedFull
                                                    .clip(Clip.antiAlias)
                                                    .make(),
                                            title: Text(docs[athletes[index]]
                                                ['fullName']),
                                            subtitle: Text(docs[athletes[index]]
                                                ['username']),
                                          )));
                                }))),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
