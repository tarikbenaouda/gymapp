import 'package:flutter/material.dart';
import 'package:gymapp/ManagerUI/setting.dart';

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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/modify about background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row( mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.keyboard_double_arrow_left_outlined,
                        size: 37,
                        color: Color(0xFFFD372A),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ), SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Modify Contact Us",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        letterSpacing: 1.3,
                      ),
                    ),
                    Icon(
                      Icons.help,
                      size: 30,
                      color: Color(0xFFFD372A),
                    )
                  ],
                ),
                const SizedBox(height: 170,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: textField1Controller1,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: 'number',
                      suffixIcon: const Icon(
                        Icons.call,
                        color: Colors.black,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 6.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: textField2Controller2,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: 'Email',
                      suffixIcon: const Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 6.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 20),
                    controller: textField3Controller3,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: 'Facebook Acount',
                      suffixIcon: const Icon(
                        Icons.facebook,
                        color: Colors.black,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 6.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 140, height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFD372A),
                    ),
                    onPressed: () {
                      _onPressed;
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Save ',style: TextStyle(fontSize: 22),),
                        Icon(Icons.check_circle_rounded, color: Colors.white, size: 24,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
