import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymapp/consts/Colors.dart';

class EventsCompetition extends StatefulWidget {
  const EventsCompetition({super.key});

  @override
  State<EventsCompetition> createState() => _EventsCompetitionState();
}

class _EventsCompetitionState extends State<EventsCompetition> {
  final _userStream =
      FirebaseFirestore.instance.collection('events').snapshots();
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
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
              var docs = snapshot.data!.docs;
              return SingleChildScrollView(
                  child: SafeArea(
                      child: Stack(children: [
                Container(
                    height: screenheight,
                    width: screenwidth,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/Events background.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            padding: const EdgeInsets.only(top: 10),
                            iconSize: 40,
                            icon: Icon(Icons.keyboard_double_arrow_left_rounded,
                                size: 25 * (screenheight / screenwidth)),
                            color: red,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                      const Text(
                        "Our Events",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 0.1 * screenheight,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: red, width: 1),
                          ),
                          height: 0.7 * screenheight,
                          width: 0.9 * screenwidth,
                          margin: const EdgeInsets.all(10),
                          child: (docs.isNotEmpty)
                              ? ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: docs.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (ctx, index) {
                                    return GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          height: screenheight * 0.15,
                                          decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  docs[index]['name'],
                                                  style: const TextStyle(
                                                      color: red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 21),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      docs[index]['begin'],
                                                      style: const TextStyle(
                                                          color: black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 21),
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .arrow_right_alt_sharp,
                                                      color: red,
                                                      size: 40,
                                                    ),
                                                    Text(
                                                      docs[index]['end'],
                                                      style: const TextStyle(
                                                          color: black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 21),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      docs[index]['reduction'],
                                                      style: const TextStyle(
                                                          color: red,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 21),
                                                    ),
                                                    const Text(
                                                      "(Reductions)",
                                                      style: TextStyle(
                                                        fontSize: 21,
                                                        color: black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]),
                                        ));
                                  })
                              : const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "No events,wait for us soon",
                                      style:
                                          TextStyle(color: white, fontSize: 24),
                                    ),
                                    Icon(
                                      Icons.add_card_rounded,
                                      size: 24,
                                      color: white,
                                    )
                                  ],
                                )),
                    ]))
              ])));
            }));
  }
}
