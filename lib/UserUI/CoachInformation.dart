import 'package:flutter/material.dart';

import '../common_widgets/my_textformfield.dart';

class CoachInforamtion extends StatefulWidget {
  const CoachInforamtion({super.key});

  @override
  State<CoachInforamtion> createState() => _CoachInforamtionState();
}

class _CoachInforamtionState extends State<CoachInforamtion> {
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
              " Coach Information ",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 550,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ListTile(
                      autofocus: true,
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                      ),
                      title: Text(
                        "variable username",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  MyInfos(Textinput: " FullName", Textinput2: "variable "),
                  SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Age", Textinput2: "variable "),
                  SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Email", Textinput2: "variable of Email"),
                  SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Phone Number", Textinput2: "variable"),
                  SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Height", Textinput2: "variable"),
                  SizedBox(
                    height: 3,
                  ),
                  MyInfos(Textinput: " Old Coching ", Textinput2: "variable"),
                  SizedBox(
                    height: 3,
                  ),
                  MyInfos(
                      Textinput: " Coaching During ", Textinput2: "variable "),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
