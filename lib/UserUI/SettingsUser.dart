import 'package:flutter/services.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:gymapp/controlllers/profile_controller.dart';

class SettingsUser extends StatefulWidget {
  const SettingsUser({super.key});

  @override
  State<SettingsUser> createState() => _SettingsUserState();
}

class _SettingsUserState extends State<SettingsUser> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenlength = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/20.jpg"), fit: BoxFit.fill)),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  children: const [
                    Icon(
                      Icons.keyboard_double_arrow_left_outlined,
                      color: Color(0xFFFF1E0F),
                      size: 35,
                    ),
                    SizedBox(
                      width: 85,
                    ),
                    Center(
                      child: Text(
                        " Settigns",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(children: [
              Image.asset(
                icGoogleLogo,
                width: 100,
                fit: BoxFit.fill,
              ).box.roundedFull.clip(Clip.antiAlias).make(),
              30.heightBox,
              Column(
                children: [
                  TextButton(
                      onPressed: (() {}),
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFF1E0F),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Change Picture",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            IconButton(
                                onPressed: () {
                                  Get.find<ProfileController>()
                                      .changeImage(context);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      )),
                ],
              ),
              myTextformfield(
                  hint: "weight    Kg ",
                  icon: const Icon(Icons.edit),
                  controller: null,
                  limit: 3,
                  type: TextInputType.number,
                  filter: FilteringTextInputFormatter.digitsOnly),
              myTextformfield(
                  hint: "Height    cm ",
                  icon: const Icon(Icons.edit),
                  controller: null,
                  limit: 3,
                  filter: FilteringTextInputFormatter.digitsOnly,
                  type: TextInputType.number),
              myTextformfield(
                  hint: "Age",
                  icon: const Icon(Icons.edit),
                  controller: null,
                  limit: 2,
                  filter: FilteringTextInputFormatter.digitsOnly,
                  type: TextInputType.number),
              const SizedBox(
                height: 4,
              ),
              myTextformfield(
                hint: "User NAme",
                icon: const Icon(Icons.edit),
                controller: null,
                type: TextInputType.name,
              ),
              const SizedBox(
                height: 4,
              ),
              myTextformfield(
                  hint: " Email",
                  icon: const Icon(Icons.edit),
                  controller: null,
                  type: TextInputType.emailAddress),
              const SizedBox(
                height: 4,
              ),
              myTextformfield(
                  hint: "Phone Number",
                  icon: const Icon(Icons.edit),
                  controller: null,
                  limit: 10,
                  filter: FilteringTextInputFormatter.digitsOnly),
              const SizedBox(
                height: 4,
              ),
            ]),
            TextButton(
                onPressed: (() {}),
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 240,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFF1E0F),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          " Save The Changes",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
