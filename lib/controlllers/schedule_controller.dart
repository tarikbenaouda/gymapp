import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../consts/firebase_consts.dart';

class ScheduleController extends GetxController {
  gymState({
    id,
  }) async {
    var state = await firestore.collection('schedule').doc(id).get();
    var store = firestore.collection('schedule').doc(id);
    await store.set(
      {
        'gymState': !state['gymState'],
      },
      SetOptions(merge: true),
    );
  }
}
