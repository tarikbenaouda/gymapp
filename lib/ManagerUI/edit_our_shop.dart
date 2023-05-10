import 'package:flutter/material.dart';

class edit_our_shop extends StatefulWidget {
  @override
  State<edit_our_shop> createState() => edit_our_shop_State();
}

class edit_our_shop_State extends State<edit_our_shop> {
  Color r = Colors.red;

  Color w = Colors.white;

  List<String> type_product = [
    "Protein",
    "WHEY",
    "BCAA",
    "vitamin",
    "B",
    "D",
    "E",
    "A"
  ];

  int current = 0;
  int number_shops = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/edit shop back ground.jpg"),
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
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Edit Our Shop",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Icon(
                Icons.shopping_cart_sharp,
                color: r,
                size: 20,
              )
            ]),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: type_product.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.all(5),
                                  width: 100,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: current == index
                                          ? Colors.red
                                          : Colors.white54,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      type_product[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: current == index
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "images/edit shop mini back ground back ground.jpg"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: r, width: 1),
                    ),
                    height: 550,
                    width: 400,
                    margin: EdgeInsets.all(5),
                    child: GridView.builder(
                        itemCount: number_shops + 1,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (contex, index) {
                          if (number_shops == index)
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    print(index);
                                    number_shops += 1;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 231, 226, 226),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  height: 150,
                                  //width: 50,
                                  child: Center(
                                    child: Icon(
                                      Icons.add_circle_outline_sharp,
                                      color: Colors.black,
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
                                  color: Color.fromARGB(255, 231, 226, 226),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                height: 150,
                                //width: 40,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 110,
                                      width: 100,
                                      decoration: BoxDecoration(),
                                      child: Center(
                                        child: Image.asset(
                                          "images/.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      width: double.infinity,
                                      color: Colors.black,
                                    ),
                                    Center(
                                        child: Container(
                                      height: 30,
                                      width: 150,
                                      decoration: BoxDecoration(),
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                        decoration: InputDecoration(
                                          hintText: "Name of product",
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
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
                                          color: Colors.black,
                                          fontSize: 17,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Price",
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            );
                        }),
                  ),
                ],
              ),
            ),
          ])),
    )));
  }
}
