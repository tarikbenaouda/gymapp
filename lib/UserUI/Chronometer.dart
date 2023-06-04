import 'package:gymapp/consts/consts.dart';

import 'package:neon_circular_timer/neon_circular_timer.dart';

void main() => runApp(Chronometer());

class Chronometer extends StatelessWidget {
  final CountDownController controller = new CountDownController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          padding: const EdgeInsets.only(top: 50),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/20.jpg",
                  ),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.keyboard_double_arrow_left_outlined,
                        size: 35,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Chronometer",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.timer_outlined,
                    size: 30,
                    color: Colors.red,
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              NeonCircularTimer(
                  onComplete: () {
                    controller.restart();
                  },
                  width: 200,
                  controller: controller,
                  duration: 3600,
                  strokeWidth: 10,
                  isTimerTextShown: true,
                  neumorphicEffect: true,
                  outerStrokeColor: Colors.red,
                  innerFillGradient: const LinearGradient(
                      colors: [Colors.black38, Colors.black]),
                  neonGradient: LinearGradient(
                      colors: [Colors.black, Colors.red.shade400]),
                  strokeCap: StrokeCap.round,
                  innerFillColor: Colors.black12,
                  backgroudColor: Colors.red.shade100,
                  neonColor: Colors.red.shade900),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              icon: const Icon(
                                Icons.play_arrow,
                                color: Colors.red,
                                size: 35,
                              ),
                              onPressed: () {
                                controller.resume();
                              }),
                          Text("Play", style: TextStyle(fontSize: 20, color: Colors.red),)
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: const Icon(
                                Icons.pause,
                                color: Colors.red,
                                size: 35,
                              ),
                              onPressed: () {
                                controller.pause();
                              }),
                          Text("Pause", style: TextStyle(fontSize: 20, color: Colors.red),)
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: const Icon(
                                Icons.repeat,
                                color: Colors.red,
                                size: 35,
                              ),
                              onPressed: () {
                                controller.restart();
                              }),
                          Text("Reply", style: TextStyle(fontSize: 20, color: Colors.red),)
                        ],
                      ),
                    ]),
              )
            ],
          ),
        )));
  }
}
