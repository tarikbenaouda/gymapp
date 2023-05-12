import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common_widgets/my_textformfield.dart';

void main() => runApp(OurstateAthlete());

class OurstateAthlete extends StatelessWidget {
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
              image: AssetImage("images/our stats background.jpg"),
              fit: BoxFit.fill)),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.keyboard_double_arrow_left_outlined,
                  color: Color(0xFFFD372A),
                  size: 35,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Our Stats",
                  style: TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.pie_chart_outline_outlined,
                  color: Color(0xFFE6E6E6),
                  size: 25,
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: (double.infinity) - 10,
              height: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(image: AssetImage("images/18.jpg"))),
              child: Column(children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Our Athletes Monthly Stats",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Text(
                          " Month :",
                          style: TextStyle(fontSize: 16),
                        ),

                        Text("Variable"), //variable of  mounth
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                MyInfos(Textinput: " Monthly Income", Textinput2: "variable"),
                SizedBox(
                  height: 8,
                ),
                MyInfos(Textinput: " NEt Profis", Textinput2: "variable"),
                //variable of income
              ]),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          MyInfos(Textinput: " The Mounth Stats are", Textinput2: "variable"),
          SizedBox(
            height: 8,
          ),
          MyInfos(Textinput: " Number Of New Athletes", Textinput2: "variable"),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            image: AssetImage("images/background2.jpg"),
                            fit: BoxFit.fill)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        " Total The Year Stats",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            image: AssetImage("images/background2.jpg"),
                            fit: BoxFit.fill)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        " To See Last Mounth Stats",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    ));
  }
}
