import 'package:flutter/material.dart';
//import 'package:gymapp/makeselectorprofileathlete.dart';
import 'package:gymapp/widgetselectorsignup2.dart';

class Profileathlete extends StatefulWidget {
  const Profileathlete({super.key});

  @override
  State<Profileathlete> createState() => _ProfileathleteState();
}

class _ProfileathleteState extends State<Profileathlete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/20.jpg"), fit: BoxFit.cover)),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("ListAthletes");
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.keyboard_double_arrow_left_outlined,
                      color: Color(0xFFFF1E0F),
                      size: 35,
                    ),
                    Text(
                      " The Athlete Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                    Icon(
                      Icons.person,
                      color: Color(0xFFFF1E0F),
                      size: 28,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 550,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  image: DecorationImage(
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
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        //url of image
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 60,
                        width: 170,
                        //username
                        child: Center(
                          child: Text(
                            "Hako Djerad fojdgdn",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      //

                      Text("  , Year",
                          style: TextStyle(color: Colors.white, fontSize: 15))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Color(0xFFE6E6E6),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Height:',
                                  style: TextStyle(
                                      color: Color(0xFF252525), fontSize: 20),
                                ),
                              ),
                              Text("VARIABLE")
                            ],
                          )),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Color(0xFFE6E6E6),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Weight:',
                                  style: TextStyle(
                                      color: Color(0xFF252525), fontSize: 20),
                                ),
                              ),
                              Text("VARIABLE")
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Center(
                  child: Text(
                    "For Contact The Athlete",
                    style: TextStyle(color: Color(0xFFE6E6E6), fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email:",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          // variable of email
                          Text(
                            "variable of email ",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                          Icon(Icons.email)
                        ],
                      )),
                ),
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Number :",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          // variable of email
                          Text(
                            "variable of numberofphone ",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                          Icon(Icons.phone)
                        ],
                      )),
                ),
                Center(
                  child: Text(
                    "The Athlete Payement",
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " The Paid Offer:",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          // variable of email
                          Text(
                            "variable of offer ",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " Payement End: ",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          // variable of email
                          Text(
                            "function calcul",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      )),
                ),
                TextButton(
                    onPressed: (() {}),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "Update Payement",
                        style:
                            TextStyle(color: Color(0xFFFF1E0F), fontSize: 18),
                      ),
                    )),
                TextButton(
                    onPressed: (() {}),
                    child: Container(
                      height: 40,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFFF1E0F),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Delete Athlete",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
