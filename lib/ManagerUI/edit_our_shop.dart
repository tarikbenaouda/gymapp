import 'package:flutter/material.dart';
import 'package:gymapp/consts/Colors.dart';

import '../common_widgets/my_textformfield.dart';

class Product {
  String url_image = "";
  String product_name = "";
  String price = "";
  Product(
      {required this.url_image,
      required this.product_name,
      required this.price});
}

class product_type {
  String typeName = "";
  List<Product> product_list;

  product_type({required this.typeName, required this.product_list});
}

class edit_our_shop extends StatefulWidget {
  @override
  State<edit_our_shop> createState() => edit_our_shop_State();
}

class edit_our_shop_State extends State<edit_our_shop> {
  Map<String, List<Product>> product_map = {
    'Protein': [
      Product(
          url_image: "images/shop1.png",
          product_name: 'P 10',
          price: '1000.99 DA'),
      Product(
          url_image: "images/shop2.png",
          product_name: 'Vitamin 1',
          price: '2000.99 DA')
    ],
    'WHEY': [
      Product(
          url_image: "images/shop3.png",
          product_name: 'B 3',
          price: '1500.99 DA'),
      Product(
          url_image: "images/shop4.png",
          product_name: 'B 12',
          price: '2500.99 DA'),
      Product(
          url_image: "images/shop5.png",
          product_name: 'Protein A',
          price: '3000.00 DA')
    ]
  };

  int current = 0;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double statusBarBottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
          height: screenheight,
          width: screenwidth,
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
                  iconSize: 25 * (screenheight / screenwidth),
                  icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
                  color: red,
                  onPressed: () {},
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Edit Our Shop",
                  style: TextStyle(
                    color: white,
                    fontSize: 20,
                  )),
              Icon(Icons.shopping_cart_sharp,
                  color: red, size: 20 * (screenheight / screenwidth))
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
                        itemCount: product_map
                            .length, // This list is defined at the beginning
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
                                      color: current == index ? red : white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      product_map.keys.toList()[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color:
                                              current == index ? white : black),
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
                        border: Border.all(color: red, width: 1),
                      ),
                      width: screenwidth - 10,
                      height: screenheight -
                          statusBarBottom -
                          statusBarHeight -
                          250,
                      margin: EdgeInsets.all(10),
                      child: GridView.builder(
                        itemCount:
                            product_map['${product_map.keys.toList()[current]}']
                                    ?.length ??
                                0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Image.asset(
                                      product_map['${product_map.keys.toList()[current]}']
                                                  ?[index]
                                              .url_image ??
                                          '',
                                      width: screenwidth * 0.1,
                                      height: screenheight * 0.1,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    color: black,
                                    width: screenwidth,
                                    height: 2,
                                  ),
                                  Center(
                                    child: Text(
                                      "${product_map['${product_map.keys.toList()[current]}']?[index].product_name ?? ''}",
                                      style: TextStyle(
                                          fontSize:
                                              10 * (screenheight / screenwidth),
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "${product_map['${product_map.keys.toList()[current]}']?[index].price ?? ''}",
                                      style: TextStyle(
                                          fontSize:
                                              10 * (screenheight / screenwidth),
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                  FloatingActionButton(
                    backgroundColor: white,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              backgroundColor: Color(0xFF4F4F4F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 50.0,
                              ),
                              title: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            color: red,
                                            size: 20 *
                                                (screenheight / screenwidth),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          }),
                                    ],
                                  ),
                                  Container(
                                    width: 0.45 * screenwidth,
                                    height: 0.3 * screenheight,
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ],
                              ),
                              content: SingleChildScrollView(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  myTextformfield(
                                    hint: "Product Name",
                                    icon: Icon(
                                      Icons.edit,
                                      color: red,
                                    ),
                                  ),
                                  myTextformfield(
                                    hint: "Price",
                                    icon: Icon(
                                      Icons.price_check,
                                      color: red,
                                    ),
                                  ),
                                  myTextformfield(
                                    hint: "Our Quantity",
                                    icon: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: red,
                                    ),
                                  ),
                                ],
                              )),
                              actions: <Widget>[
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: red,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: screenheight * 0.05,
                                    width: screenwidth * 0.3,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Save',
                                              style: TextStyle(
                                                fontSize: 10 *
                                                    (screenheight /
                                                        screenwidth),
                                                color: white,
                                              ),
                                            ),
                                            Icon(Icons.check_circle,
                                                color: white),
                                          ],
                                        )),
                                  ),
                                )
                              ]);
                        },
                      );
                    },
                    child: Icon(
                      Icons.add,
                      color: black,
                      size: 20 * (screenheight / screenwidth),
                    ),
                  )
                ],
              ),
            ),
          ])),
    )));
  }
}
