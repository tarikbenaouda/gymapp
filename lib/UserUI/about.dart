import 'package:flutter/material.dart';

import 'home_view.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/about help background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 310),
                child: GestureDetector(
                  child: Icon(
                    Icons.keyboard_double_arrow_left_outlined,
                    size: 37,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 1.3,
                    ),
                  ),
                  Icon(
                    Icons.info,
                    size: 30,
                    color: Color(0xFFFD372A),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFF252525),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                          'About The Gym : ',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                        Text(
                          '',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                        ),
                        SizedBox(height: 170.0),
                        Center(
                            child: Text(
                          'About This App :',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                        Text(
                          '',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ],
              )
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
              onTap: () {},
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
              onTap: () {},
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
