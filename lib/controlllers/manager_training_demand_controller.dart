import 'package:get/get.dart';
import 'package:gymapp/consts/firebase_consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManagerTrainingDemandController extends GetxController {
  acceptAthlete({
    training,
    type,
    id,
  }) async {
    var store = firestore.collection(usersCollection).doc(id);
    await store.set(
      {
        'type': type,
        'training': training,
      },
      SetOptions(merge: true),
    );
  }

  refuseAthlete({
    training,
    id,
  }) async {
    var store = firestore.collection(usersCollection).doc(id);
    await store.set(
      {
        'training': training,
      },
      SetOptions(merge: true),
    );
  }
}
