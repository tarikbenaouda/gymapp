import 'package:flutter/material.dart';

class ModifyEvents extends StatefulWidget {
  @override
  _ModifyEventsState createState() => _ModifyEventsState();
}

class _ModifyEventsState extends State<ModifyEvents> {
  late String textField1, textField2, textField3, textField4, textField5;

  List<Widget> _containers = [];
  TextEditingController textField1Controller1 = TextEditingController();
  TextEditingController textField2Controller2 = TextEditingController();
  TextEditingController textField3Controller3 = TextEditingController();
  TextEditingController textField4Controller4 = TextEditingController();
  TextEditingController textField5Controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/modify events background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _containers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      _containers[index],
                      const SizedBox(height: 30),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF232323)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: const Color(0xFF4F4F4F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 40.0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Add New Event',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Color(0xFFFD372A),
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  })
                            ],
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Event Name',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                TextField(
                                    controller: textField1Controller1,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Begin',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: TextField(
                                          controller: textField2Controller2,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          )),
                                    ),
                                    const Text(
                                      'End',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: TextField(
                                          controller: textField3Controller3,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                const Text(
                                  'Training Offer',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                TextField(
                                  controller: textField4Controller4,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Shop Reductions',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                TextField(
                                  controller: textField5Controller5,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Row(
                                children: const [
                                  Text(
                                    'Save ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFFFD372A),
                                    ),
                                  ),
                                  Icon(Icons.check_circle, color: Colors.white),
                                ],
                              ),
                              onPressed: () {
                                Navigator.of(context).pop({
                                  textField1 = textField1Controller1.text,
                                  textField2 = textField2Controller2.text,
                                  textField3 = textField3Controller3.text,
                                  textField4 = textField4Controller4.text,
                                  textField5 = textField5Controller5.text,
                                });
                                setState(() {
                                  _containers.add(
                                    FractionallySizedBox(
                                      widthFactor: 0.9,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Container(
                                          height: 480,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF232323),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Center(
                                                  child: Text(
                                                'The Published Event :',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              )),
                                              const SizedBox(height: 10.0),
                                              Center(
                                                child: Container(
                                                    height: 55,
                                                    width: 300,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      '$textField1',
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20),
                                                    ))),
                                              ),
                                              const SizedBox(height: 10.0),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(13),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      'Begin',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    Container(
                                                        height: 55,
                                                        width: 90,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                          '$textField2',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20),
                                                        ))),
                                                    const Text(
                                                      'End ',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    Container(
                                                        height: 55,
                                                        width: 90,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                          '$textField3',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20),
                                                        )))
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.all(13),
                                                child: Text(
                                                  'Training Offer',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              Center(
                                                child: Container(
                                                    height: 55,
                                                    width: 300,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      '$textField4',
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20),
                                                    ))),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.all(13),
                                                child: Text(
                                                  'Shop Reductions',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              ),
                                              Center(
                                                child: Container(
                                                    height: 55,
                                                    width: 300,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      '$textField5',
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20),
                                                    ))),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 100,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary: const Color(
                                                              0xFFFD372A),
                                                        ),
                                                        onPressed: null,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: const [
                                                            Text('Save',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        20)),
                                                            Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: Colors
                                                                    .white),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: const Color(
                                                            0xFFFD372A),
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          _containers
                                                              .removeLast();
                                                        });
                                                      },
                                                      child: const Text(
                                                        'Delete',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 10.0),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    children: const [
                      Text(
                        'Add New Event ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
