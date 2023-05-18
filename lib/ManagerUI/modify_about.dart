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
          height: (MediaQuery.of(context).size.height),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/modify about background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text(
                        "Modify About ",
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
              Container(
                height: 670,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image:
                        AssetImage("images/help and about mini background.jpg"),
                    fit: BoxFit.fill,
                  ),
                  color: const Color(0xFF4F4F4F),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'About The Gym :',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        style: const TextStyle(fontSize: 22),
                        scrollPhysics: const ScrollPhysics(),
                        maxLines: 3,
                        controller: _textEditingController1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 70.0, horizontal: 6.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'About The App :',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 22),
                        scrollPhysics: const ScrollPhysics(),
                        maxLines: 3,
                        controller: _textEditingController2,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 70.0, horizontal: 6.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFFD372A),
                        ),
                        onPressed: _onPressed,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
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
                    const SizedBox(height: 10.0),
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
