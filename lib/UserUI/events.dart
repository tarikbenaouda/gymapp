import 'package:flutter/material.dart';
import 'package:gymapp/UserUI/Profileuser.dart';

import 'home_view.dart';

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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Events background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 330),
                child: GestureDetector(
                  child: Icon(
                    Icons.keyboard_double_arrow_left_outlined,
                    size: 40,
                    color: Color(0xFFFD372A),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeViewAthlete()));
                  },
                ),
              ),
              Text(
                "Gym Events",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  letterSpacing: 1.3,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(17.0),
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Ramadan Event $event",
                          style: TextStyle(fontSize: 25),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
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
                              style: TextStyle(
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
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xFF252525),
                  borderRadius: BorderRadius.circular(17.0),
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Ramadan Event $event",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text("Training Offer ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 55,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "14 Sessions$trainingOffer                  1500 DA",
                                style: TextStyle(
                                    color: Color(0xFF252525),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Shop Reductions ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 55,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "15% $reduction                All Production ",
                                style: TextStyle(
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
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Color(0xFFE1E1E1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeViewAthlete()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(),
                child: Container(
                  width: 70,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.home_filled,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileUser()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeViewAthlete()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.storefront_outlined,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileUser()), //Settings
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                child: Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
