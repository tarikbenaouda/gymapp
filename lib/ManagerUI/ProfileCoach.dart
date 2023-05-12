import 'package:flutter/material.dart';

class ProfileCoach extends StatefulWidget {
  const ProfileCoach({super.key});

  @override
  State<ProfileCoach> createState() => _ProfileCoachState();
}

class _ProfileCoachState extends State<ProfileCoach> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenlength,
        width: screenwidth,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/16.jpg"), fit: BoxFit.fill)),
        child: ListView(children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("Demandcoaching");
                  },
                  child: Icon(
                    Icons.keyboard_double_arrow_left_outlined,
                    color: Colors.red,
                    size: 35,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              " Demand For Coaching ",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: ListTile(
              autofocus: true,
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
              ),
              title: Text(
                "variable username",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 400,
              width: screenwidth - 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("images/18.jpg"), fit: BoxFit.fill)),
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Text(
                      "Informations In The Demand Formule",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 40,
                      width: screenwidth - 40,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Text(
                            " Full name : ",
                            style: TextStyle(
                                color: Color(0xFF252525), fontSize: 20),
                            //variable
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 40,
                      width: screenwidth - 40,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Text(
                            " Age  : ",
                            style: TextStyle(
                                color: Color(0xFF252525), fontSize: 20),
                            //variable
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 40,
                      width: screenwidth - 40,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Text(
                            " Old in Coaching ",
                            style: TextStyle(
                                color: Color(0xFF252525), fontSize: 20),
                            //variable
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 40,
                      width: screenwidth - 40,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Text(
                            " Training During  : ",
                            style: TextStyle(
                                color: Color(0xFF252525), fontSize: 20),
                            //variable
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 40,
                      width: screenwidth - 40,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Text(
                            "  Phone Number  : ",
                            style: TextStyle(
                                color: Color(0xFF252525), fontSize: 20),
                            //variable
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 130,
                      width: screenwidth - 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFE6E6E6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            " Why Our Gym :  ",
                            style: TextStyle(
                                color: Color(0xFF252525), fontSize: 20),
                          ),
                          //contoller of user(Why choose our gym )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              " Accepte ",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
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
                    onPressed: () {},
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              " Refuse ",
                              style: TextStyle(fontSize: 18, color: Colors.red),
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
      ),
    );
  }
}
