import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ModifyAbout extends StatefulWidget {
  @override
  _ModifyAboutState createState() => _ModifyAboutState();
}

class _ModifyAboutState extends State<ModifyAbout> {
  String _textField1 = '';
  String _textField2 = '';

  _onPressed() {
    _textField1 = _textEditingController1.text;
    _textField2 = _textEditingController2.text;
  }

  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: (MediaQuery.of(context).size.height) * 0.8,
          width: MediaQuery.of(context).size.width,
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
                        "Modify About ",
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
              Container(
                height: 670,
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
                        style: TextStyle(fontSize: 22),
                        scrollPhysics: ScrollPhysics(),
                        maxLines: 3,
                        controller: _textEditingController1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 70.0, horizontal: 6.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'About The App :',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 22),
                        scrollPhysics: ScrollPhysics(),
                        maxLines: 3,
                        controller: _textEditingController2,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 70.0, horizontal: 6.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFD372A),
                        ),
                        onPressed: _onPressed,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Save ',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.check_circle_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
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
