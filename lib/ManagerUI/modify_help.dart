import 'package:flutter/material.dart';

import 'help_sending.dart';
import 'home_page.dart';

class ModifyHelp extends StatefulWidget {
  @override
  _ModifyHelpState createState() => _ModifyHelpState();
}

class _ModifyHelpState extends State<ModifyHelp> {
  String number = '', email = '', facebook = '';
  TextEditingController textField1Controller1 = TextEditingController();
  TextEditingController textField2Controller2 = TextEditingController();
  TextEditingController textField3Controller3 = TextEditingController();
  _onPressed() {
    number = textField1Controller1.text;
    email = textField2Controller2.text;
    facebook = textField3Controller3.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/modify about background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        "Modify The Help",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          letterSpacing: 1.3,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Icon(
                      Icons.help,
                      size: 30,
                      color: Color(0xFFFD372A),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: (MediaQuery.of(context).size.height) * 0.8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("images/help and about mini background.jpg"),
                    fit: BoxFit.fill,
                  ),
                  color: Color(0xFF4F4F4F),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      ' To See The Help Sendind From Users',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpSecding()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Text('Tap Here',
                            style:
                                TextStyle(color: Colors.black, fontSize: 17)),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Modify Contact Information ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        style: TextStyle(fontSize: 20),
                        controller: textField1Controller1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: 'number',
                          suffixIcon: Icon(
                            Icons.call,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 6.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        style: TextStyle(fontSize: 20),
                        controller: textField2Controller2,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: 'Email',
                          suffixIcon: Icon(
                            Icons.mail,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 6.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        style: TextStyle(fontSize: 20),
                        controller: textField3Controller3,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: 'Facebook Acount',
                          suffixIcon: Icon(
                            Icons.facebook,
                            color: Colors.black,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 6.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFD372A),
                        ),
                        onPressed: () {
                          _onPressed;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Save'),
                            Icon(Icons.done, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
