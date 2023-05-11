import 'package:flutter/material.dart';

import 'home_page.dart';
import 'modify_about.dart';
import 'modify_help.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String nameVariable = '';
  String mailVariable = '';
  String PhoneVariable = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/admin settings background.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: GestureDetector(
                  child: Icon(
                    Icons.keyboard_double_arrow_left_outlined,
                    size: 37,
                    color: Color(0xFFFD372A),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Admin Settings",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      letterSpacing: 1.3,
                    ),
                  ),
                  Icon(
                    Icons.settings,
                    size: 37,
                    color: Color(0xFFFD372A),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 240.0),
                      child: Text("Admin Name :",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            letterSpacing: 1.3,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$nameVariable",
                            style: TextStyle(
                              color: Color(0xFF252525),
                              fontSize: 20.0,
                            ),
                          ),
                          Icon(
                            Icons.person,
                            size: 40,
                            color: Color(0xFF252525),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 240.0),
                      child: Text("Admin Mail :",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            letterSpacing: 1.3,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$mailVariable",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 160.0),
                      child: Text(
                        "Admin Phone Number :",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 1.3,
                        ),
                        softWrap: false,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$PhoneVariable",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                          Icon(
                            Icons.call,
                            size: 40,
                            color: Color(0xFF252525),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ModifyAbout()));
                  },
                  child: Container(
                    height: 60,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Modify About ',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Icon(Icons.info, size: 30, color: Color(0xFF252525)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ModifyHelp()));
                  },
                  child: Container(
                    height: 60,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Modify Help  ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        Icon(Icons.help, size: 30, color: Color(0xFF252525)),
                      ],
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 60,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 195,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFD372A), //
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.white),
                      ), // Change the background color
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home_outlined),
                        SizedBox(width: 8.0),
                        Text('Log out',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: SizedBox(
        height: 720,
        width: 225,
        child: Drawer(
          child: Container(
            color: Color(0xFF232323),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  title: Text('Menu',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text('Home',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Setting()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text('Settings',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Setting()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.contact_phone,
                    color: Colors.white,
                  ),
                  title: Text('Contact Us',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.security,
                    color: Colors.white,
                  ),
                  title: Text('Security',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  title: Text('Share',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.white,
                  ),
                  title: Text('Help',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  title: Text('About',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
