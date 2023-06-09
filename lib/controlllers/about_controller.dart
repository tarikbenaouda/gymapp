import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gymapp/consts/firebase_consts.dart';

class AboutController extends GetxController {
  updateAbout({
    aboutTheGym,
    aboutTheApp,
  }) async {
    var store = firestore.collection('about').doc('M5nFiuOJS8rjHLW3ib3K');
    await store.set(
      {
        'aboutTheGym': aboutTheGym,
        'aboutTheApp': aboutTheApp,
      },
      SetOptions(merge: true),
    );
  }
}
