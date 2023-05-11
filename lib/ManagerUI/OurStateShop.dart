import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurstateShop extends StatefulWidget {
  const OurstateShop({super.key});

  @override
  State<OurstateShop> createState() => _OurstateShopState();
}

class _OurstateShopState extends State<OurstateShop> {
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
                    image: DecorationImage(
                        image: AssetImage("images/18.jpg"), fit: BoxFit.fill)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Our Shop Monthly Stats",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 50,
                        width: (double.infinity) - 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFE6E6E6),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Text(
                              "Monthly income : ",
                              style: TextStyle(
                                  color: Color(0xFF252525), fontSize: 18),
                            ),
                          ),
                          //variable of income
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 50,
                        width: (double.infinity) - 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFE6E6E6),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Text(
                              " Net Profits : ",
                              style: TextStyle(
                                  color: Color(0xFF252525), fontSize: 18),
                            ),
                          ),
                          //variable of income
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 50,
                        width: (double.infinity) - 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFE6E6E6),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Text(
                              " This Mounth Stats Are  : ",
                              style: TextStyle(
                                  color: Color(0xFF252525), fontSize: 18),
                            ),
                          ),
                          //variable of income
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 50,
                        width: (double.infinity) - 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFE6E6E6),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: Text(
                              " Number Of Products Sold  : ",
                              style: TextStyle(
                                  color: Color(0xFF252525), fontSize: 18),
                            ),
                          ),
                          //variable of income
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 50,
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
                                      image:
                                          AssetImage("images/background2.jpg"),
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
                                      image:
                                          AssetImage("images/background2.jpg"),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
