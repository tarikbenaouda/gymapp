import 'package:flutter/services.dart';
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
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/7.jpg"), fit: BoxFit.fill)),
          child: ListView(children: [
            const SizedBox(
              height: 80,
            ),
            const Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Color(0xFFFF1E0F),
                    fontSize: 40,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
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
              filter: FilteringTextInputFormatter.digitsOnly,
              limit: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Row(
                children: [
                  const Text(
                    "You already have an acccount ? ",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(color: Color(0xFFFF1E0F), fontSize: 17),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
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
                        color: (fullNameController.text != "" &&
                                usernameController.text != "" &&
                                phoneNumberController.text != "")
                            ? const Color(0xFFFF1E0F)
                            : const Color.fromARGB(255, 255, 184, 179),
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      onTap: () {
                        (fullNameController.text != "" &&
                                usernameController.text != "" &&
                                phoneNumberController.text != "")
                            ? Get.to(
                                () => const Signup2(),
                                arguments: [
                                  fullNameController,
                                  usernameController,
                                  phoneNumberController
                                ],
                              )
                            : showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    backgroundColor: const Color(0xFF4F4F4F),
                                    title: Text(
                                      "Error",
                                      style: TextStyle(color: white),
                                    ),
                                    content: Text("Oops! The Fields are empty.",
                                        style: TextStyle(color: white)),
                                  );
                                },
                              );
                      },
                      child: const Text(
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
