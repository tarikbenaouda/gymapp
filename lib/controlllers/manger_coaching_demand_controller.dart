import 'package:get/get.dart';
import 'package:gymapp/consts/firebase_consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManagerCoachingDemandController extends GetxController {
  acceptAthlete({
    coaching,
    type,
    id,
  }) async {
    var store = firestore.collection(usersCollection).doc(id);
    await store.set(
      {
        'type': type,
        'coaching': coaching,
      },
      SetOptions(merge: true),
    );
  }

  sendDemand({
    id,
  }) async {
    var store = firestore.collection(usersCollection).doc(id);
    await store.set(
      {
        'coaching': true,
      },
      SetOptions(merge: true),
    );
  }

  refuseAthlete({
    coaching,
    id,
  }) async {
    var store = firestore.collection(usersCollection).doc(id);
    await store.set(
      {
        'coaching': coaching,
      },
      SetOptions(merge: true),
    );
  }
}
