import 'package:flutter/material.dart';

class ModifyEvents extends StatefulWidget {
  @override
  _ModifyEventsState createState() => _ModifyEventsState();
}

class _ModifyEventsState extends State<ModifyEvents> {
  late String textField1, textField2, textField3, textField4, textField5;

  List<Widget> _containers = [];
  TextEditingController textField1Controller1 = new TextEditingController();
  TextEditingController textField2Controller2 = new TextEditingController();
  TextEditingController textField3Controller3 = new TextEditingController();
  TextEditingController textField4Controller4 = new TextEditingController();
  TextEditingController textField5Controller5 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/modify events background.jpg"),
            fit: BoxFit.cover,
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
                      SizedBox(height: 30),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Add New Event'),
                      content: Column(
                        children: [
                          Text('Event Name'),
                          TextField(
                              controller: textField1Controller1,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                hintText: 'Enter text here',
                              )),
                          TextField(
                            controller: textField2Controller2,
                            decoration:
                                InputDecoration(labelText: 'Text Field 2'),
                          ),
                          TextField(
                            controller: textField3Controller3,
                            decoration:
                                InputDecoration(labelText: 'Text Field 3'),
                          ),
                          TextField(
                            controller: textField4Controller4,
                            decoration:
                                InputDecoration(labelText: 'Text Field 4'),
                          ),
                          TextField(
                            controller: textField5Controller5,
                            decoration:
                                InputDecoration(labelText: 'Text Field 5'),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
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
                                  child: Container(
                                    height: 450,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF232323),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                            child: Text(
                                          'The Published Event :',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                                        SizedBox(height: 10.0),
                                        Center(
                                          child: Container(
                                              height: 55,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                '$textField1',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ))),
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Begin',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            Container(
                                                height: 55,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '$textField2',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ))),
                                            Text(
                                              'End ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            Container(
                                                height: 55,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '$textField3',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                )))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Training Offer',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        Center(
                                          child: Container(
                                              height: 55,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                '$textField4',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ))),
                                        ),
                                        Text(
                                          'Shop Reductions',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        Center(
                                          child: Container(
                                              height: 55,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                '$textField5',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ))),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFFFD372A),
                                                ),
                                                onPressed: null,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text('Save'),
                                                    Icon(Icons.done,
                                                        color: Colors.white),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(0xFFFD372A),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _containers.removeAt(
                                                      _containers.indexOf(
                                                          _containers
                                                              as Widget));
                                                });
                                              },
                                              child: Text('Delete'),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.0),
                                      ],
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
              child: Text('Add New Event '),
            ),
          ],
        ),
      ),
    );
  }
}
