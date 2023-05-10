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
                image: AssetImage("images/20.jpg"), fit: BoxFit.cover)),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.keyboard_double_arrow_left_outlined,
                      color: Colors.red,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    width: screenwidth * 0.25,
                  ),
                  Text(
                    "Our Stats",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.pie_chart_outline_outlined,
                    color: Colors.red,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: (double.infinity) - 40,
              height: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/21.jpg"), fit: BoxFit.cover)),
              child: Column(
                children: [
                  Text(
                    "Our Shop Monthly Stats",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Text(
                            " Month :",
                            style: TextStyle(fontSize: 20),
                          ),

                          Text(
                            " April",
                            style: TextStyle(fontSize: 22),
                          ), //variable of  mounth
                        ],
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 40,
                      width: (double.infinity) - 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Row(children: [
                        Text(
                          "  Monthly income : ",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        //variable of income
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 40,
                      width: (double.infinity) - 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Row(children: [
                        Text(
                          "  Net Profits : ",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        //variable of income
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 40,
                      width: (double.infinity) - 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Row(children: [
                        Text(
                          "  This Mounth Stats Are  : ",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        //variable of income
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 40,
                      width: (double.infinity) - 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Row(children: [
                        Text(
                          "  Number Of Products Sold  : ",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        //variable of income
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 8,
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
                                image: DecorationImage(
                                    image: AssetImage("images/13.jpg"),
                                    fit: BoxFit.cover)),
                            child: Text(
                              " Total The Year Stats",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            height: 80,
                            width: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/13.jpg"),
                                    fit: BoxFit.cover)),
                            child: Text(
                              " To See Last Mounth Stats",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
