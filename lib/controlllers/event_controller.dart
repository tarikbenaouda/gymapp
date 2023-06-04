import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gymapp/consts/consts.dart';

import '../consts/firebase_consts.dart';

class EventController extends GetxController {
  storeEventData({
    name,
    begin,
    end,
    reduction,
  }) async {
    DocumentReference store = firestore.collection('events').doc();
    store.set({
      'begin': begin,
      'end': end,
      'reduction': reduction,
      'name': name,
    });
  }

  editEventData({
    name,
    begin,
    end,
    reduction,
    id,
  }) async {
    DocumentReference store = firestore.collection('events').doc(id);
    store.set({
      'begin': begin,
      'end': end,
      'reduction': reduction,
      'name': name,
    });
  }

  void deleteDocument(String documentId) {
    FirebaseFirestore.instance
        .collection('events')
        .doc(documentId)
        .delete()
        .then((value) {})
        .catchError((error) {});
  }
}
