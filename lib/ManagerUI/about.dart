import 'package:flutter/material.dart';

class About extends StatefulWidget {
  About(this.name);
  String name;

  @override
  _AboutState createState() => _AboutState(name);
}

class _AboutState extends State<About> {
  _AboutState(this.name);
  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/modify about background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text(
                        "About",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          letterSpacing: 1.3,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: Icon(
                      Icons.info,
                      size: 30,
                      color: Color(0xFFFD372A),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: 650,
                      width: 380,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4F4F4F),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'About The Gym : ',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(height: 10.0),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'About The Gym :',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(height: 10.0),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          const SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
