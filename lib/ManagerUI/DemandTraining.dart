import 'package:flutter/material.dart';

import '../common_widgets/my_textformfield.dart';

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
                      "Informations Of Athletes ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MyInfos(Textinput: " FullName ", Textinput2: "variable"),
                  SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Age ", Textinput2: "variable"),
                  SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Height ", Textinput2: "variable"),
                  SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Weigth ", Textinput2: "variable"),
                  SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Email ", Textinput2: "variable"),
                  SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Phone Number ", Textinput2: "variable"),
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