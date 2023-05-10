import 'package:flutter/material.dart';

import 'about.dart';

class ModifyAbout extends StatefulWidget {
  @override
  _ModifyAboutState createState() => _ModifyAboutState();
}

class _ModifyAboutState extends State<ModifyAbout> {
  String _textField1 = '';
  String _textField2 = '';
  String _inputText1 = '';
  String _inputText2 = '';

  void _onPressed() {
    setState(() {
      _inputText1 = _textEditingController1.text;
      _inputText2 = _textEditingController2.text;
    });
  }

  onClick() {
    MaterialPageRoute(builder: (BuildContext context) => About(_textField1));
  }

  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();

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
              fit: BoxFit.cover,
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
                        "Modify About",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          letterSpacing: 1.3,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Icon(
                      Icons.info,
                      size: 30,
                      color: Color(0xFFFD372A),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: 650,
                      width: 380,
                      decoration: BoxDecoration(
                        color: Color(0xFF4F4F4F),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'About The Gym :',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              onChanged: (text) {
                                setState(() {
                                  _textField1 = text;
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                hintText: 'Enter text here',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 70.0, horizontal: 6.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'About The Gym :',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              onChanged: (text) {
                                setState(() {
                                  _textField2 = text;
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                hintText: 'Enter text here',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 70.0, horizontal: 6.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFFD372A),
                              ),
                              onPressed: onClick,
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
                          Text('You entered: $_textField1 and $_textField2'),
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
