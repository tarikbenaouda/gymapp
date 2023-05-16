import 'package:flutter/material.dart';

class HelpSecding extends StatefulWidget {
  @override
  _HelpSecdingState createState() => _HelpSecdingState();
}

class _HelpSecdingState extends State<HelpSecding> {
  String _textField1 = '';
  String _textField2 = '';
  String _inputText1 = '';
  String _inputText2 = '';

  void _onPressed() {
    setState(() {
      _inputText1 = _textEditingController1.text;
      _inputText2 = _textEditingController2.text;
    });
  }

// onClick(){
//     Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => About(_textField1,_textField2)));
// }
  final TextEditingController _textEditingController1 = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text(
                        "Modify The Help",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          letterSpacing: 1.3,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: Icon(
                      Icons.help,
                      size: 30,
                      color: Color(0xFFFD372A),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: 650,
                      width: 380,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4F4F4F),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'To See The Help Sendind From Users',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
