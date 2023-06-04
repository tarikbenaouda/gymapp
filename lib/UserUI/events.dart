import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsCompetition extends StatefulWidget {
  @override
  _EventsCompetitionState createState() => _EventsCompetitionState();
}

class _EventsCompetitionState extends State<EventsCompetition> {
  String event = '', begin = '', end = '', trainingOffer = '', reduction = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Events background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 330),
                child: GestureDetector(
                  child: const Icon(
                    Icons.keyboard_double_arrow_left_outlined,
                    size: 40,
                    color: Color(0xFFFD372A),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              const Text(
                "Gym Events",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  letterSpacing: 1.3,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(17.0),
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Ramadan Event $event",
                          style: const TextStyle(fontSize: 25),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Begin ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              "22/04$begin",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "End ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              "22/05$end",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: const Color(0xFF252525),
                  borderRadius: BorderRadius.circular(17.0),
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Ramadan Event $event",
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text("Training Offer ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "14 Sessions$trainingOffer                  1500 DA",
                                style: const TextStyle(
                                    color: Color(0xFF252525),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Shop Reductions ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "15% $reduction                All Production ",
                                style: const TextStyle(
                                    color: Color(0xFF252525),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
