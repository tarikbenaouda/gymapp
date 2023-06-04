import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../consts/firebase_consts.dart';

class ScheduleController extends GetxController {
  gymState({
    stateGym,
  }) async {
    var state = await firestore
        .collection('schedule')
        .doc('3EoQCS9N72bPnUGNfBZb')
        .get();
    var store = firestore.collection('schedule').doc('3EoQCS9N72bPnUGNfBZb');
    await store.set(
      {
        'GymState': stateGym,
      },
      SetOptions(merge: true),
    );
  }
}
