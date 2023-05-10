import 'package:gymapp/consts/consts.dart';

class Signup1 extends StatefulWidget {
  const Signup1({super.key});

  @override
  State<Signup1> createState() => _Signup1State();
}

class _Signup1State extends State<Signup1> {
  var fullNameController = TextEditingController();
  var usernameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
          height: screenlength,
          width: screenwidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/7.jpg"), fit: BoxFit.fill)),
          child: ListView(children: [
            SizedBox(
              height: 80,
            ),
            Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Color(0xFFFF1E0F),
                    fontSize: 40,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            myTextformfield(
              hint: "Full Name",
              type: TextInputType.name,
              controller: fullNameController,
            ),
            myTextformfield(
              hint: "User Name",
              type: TextInputType.text,
              controller: usernameController,
            ),
            myTextformfield(
              hint: "Phone Number",
              type: TextInputType.phone,
              controller: phoneNumberController,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Row(
                children: [
                  Text(
                    "You already have an acccount ? ",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      //Navigator.of(context).pushNamed("Signup1");
                      Get.back();
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Color(0xFFFF1E0F), fontSize: 17),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Color(0xFFFF1E0F),
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      onTap: () {
                        //Navigator.of(context).pushNamed("Signup2");
                        Get.to(
                          () => Signup2(),
                          arguments: [
                            fullNameController,
                            usernameController,
                            phoneNumberController
                          ],
                        );
                      },
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ])),
    )));
  }
}
