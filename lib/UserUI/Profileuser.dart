import 'package:flutter/material.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/20.jpg"), fit: BoxFit.cover)),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("Homeuser");
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  children: [
                    Icon(
                      Icons.keyboard_double_arrow_left_outlined,
                      color: Color(0xFFFF1E0F),
                      size: 35,
                    ),
                    SizedBox(
                      width: 85,
                    ),
                    Center(
                      child: Text(
                        " Profil",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 550,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/21.jpg",
                      ),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(20)),
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        //url of image
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          TextButton(
                              onPressed: (() {}),
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFF1E0F),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Change Picture",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              )),
                          TextButton(
                              onPressed: (() {}),
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Color(0xFFE6E6E6),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Send Demand Training ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.send,
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                              )),
                        ],
                      ),

                      //
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Color(0xFFE6E6E6),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Height:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF252525),
                                      fontSize: 20),
                                ),
                              ),
                              Text("VARIABLE")
                            ],
                          )),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Color(0xFFE6E6E6),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Weight:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF252525),
                                      fontSize: 20),
                                ),
                              ),
                              Text("VARIABLE")
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Age  :",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          // variable of email
                          Text(
                            "variable of email ",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "FullName :",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          // variable of fullName
                          Text(
                            "variable of fullName ",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " UserName :",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          // variable of email
                          Text(
                            "variable   ",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " Email:",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          // variable of email
                          Text(
                            "variable of offer ",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                          Icon(Icons.email)
                        ],
                      )),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " Phone Number ",
                            style: TextStyle(
                                color: Color(0xFF252525),
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          // variable of email
                          Text(
                            "function calcul",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                          Icon(Icons.phone)
                        ],
                      )),
                ),
                TextButton(
                    onPressed: (() {}),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 240,
                      decoration: BoxDecoration(
                          color: Color(0xFFFF1E0F),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Go To Settings To Modify",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    )),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
