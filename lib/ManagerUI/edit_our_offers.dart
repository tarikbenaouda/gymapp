import 'package:flutter/material.dart';

class Offer {
  String type_offre;
  int month;
  int sessions;
  int price;

  Offer(
      {required this.type_offre,
      required this.month,
      required this.sessions,
      required this.price});
}

class edit_our_offres extends StatefulWidget {
  @override
  State<edit_our_offres> createState() => edit_our_offres_State();
}

class edit_our_offres_State extends State<edit_our_offres> {
  List<Offer> offers = [
    Offer(
      type_offre: 'Normal offre',
      month: 10,
      price: 10,
      sessions: 10,
    ),
  ];
  Color r = Colors.red;
  Color w = Colors.white;

  int number_offres = 0;
  bool _showContainer = false;
  String ValueChooseOffre = "normal offre";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Stack(children: [
        Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/edit offers back ground.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    padding: EdgeInsets.only(top: 30),
                    iconSize: 40,
                    icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
                    color: r,
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Edit Our Offres",
                    style: TextStyle(
                      color: w,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.attach_money,
                    color: w,
                    size: 20,
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/edit offers mini background.jpg",
                      ),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: r, width: 1),
                ),
                height: 600,
                width: 400,
                margin: EdgeInsets.all(10),
                child: GridView.builder(
                    itemCount: number_offres + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (contex, index) {
                      if (number_offres == index)
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                print(index);
                                number_offres += 1;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 92, 81, 81),
                              ),
                              margin: EdgeInsets.all(10),
                              height: 70,
                              width: 70,
                              child: Center(
                                child: Icon(
                                  Icons.add_circle_outline_sharp,
                                  color: w,
                                  size: 50,
                                ),
                              ),
                            ));
                      else
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: r,
                            ),
                            margin: EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.cancel_outlined,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                Center(
                                    child: Container(
                                  height: 20,
                                  width: 110,
                                  decoration: BoxDecoration(),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 84, 25, 180),
                                        fontSize: 17),
                                    decoration: InputDecoration(
                                      hintText: "Type of offre",
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 25, 180),
                                          fontSize: 17),
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                    child: Container(
                                  height: 30,
                                  width: 150,
                                  decoration: BoxDecoration(),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                    decoration: InputDecoration(
                                      hintText: "Months",
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                )),
                                Center(
                                    child: Container(
                                  height: 30,
                                  width: 150,
                                  decoration: BoxDecoration(),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                    decoration: InputDecoration(
                                      hintText: "Sessions",
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                    child: Container(
                                  height: 30,
                                  width: 150,
                                  decoration: BoxDecoration(),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 84, 25, 180),
                                        fontSize: 17),
                                    decoration: InputDecoration(
                                      hintText: "Price",
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 25, 180),
                                          fontSize: 17),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        );
                    }),
              )
            ])),
        /* if (_showContainer)
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 179, 62, 62)),
            margin: EdgeInsets.symmetric(vertical: 150, horizontal: 30),
            height: 350,
            width: 330,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: w,
                        size: 40,
                      ),
                      onPressed: () {
                        setState(() {
                          _showContainer = !_showContainer;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Edit The Offer",
                      style: TextStyle(color: w, fontSize: 20),
                    ),
                    Icon(
                      Icons.edit,
                      color: w,
                      size: 20,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: 50,
                    width: 140,
                    child: TextField(
                      style: TextStyle(color: w),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black45,
                        hintStyle: TextStyle(
                          color: w,
                        ),
                        hintText: "Mounth",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 50,
                    width: 140,
                    child: TextField(
                      style: TextStyle(color: w),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black45,
                        hintStyle: TextStyle(
                          color: w,
                        ),
                        hintText: "Sessions",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: 300,
                  child: TextField(
                    style: TextStyle(color: w),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black45,
                      hintText: "Price",
                      hintStyle: TextStyle(
                        color: w,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: 300,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: r,
                        )),
                    height: 50,
                    width: 300,
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: r,
                      value: ValueChooseOffre,
                      icon: Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 20,
                        color: w,
                      ),
                      items: const [
                        DropdownMenuItem(
                            value: "normal offre",
                            child: Text(
                              "normal offre",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                        DropdownMenuItem(
                            value: "special offre",
                            child: Text(
                              "spescail offre",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                        DropdownMenuItem(
                            value: "event offre",
                            child: Text(
                              "event offre",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ))
                      ],
                      onChanged: (String? newvalue) {
                        setState(() {
                          ValueChooseOffre = newvalue!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.black45,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Delete",
                            style: TextStyle(
                              color: w,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Icon(
                            Icons.delete,
                            color: w,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.black45,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Save",
                            style: TextStyle(
                              color: w,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Icon(
                            Icons.save_alt,
                            color: w,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          */
      ])),
    ));
  }
}
