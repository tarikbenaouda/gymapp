import 'package:gymapp/consts/consts.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gymapp/consts/consts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class ManagerProfilesController extends GetxController {
  var offerController = TextEditingController();
  deleteAthlete({
    uid,
  }) async {
    var store = firestore.collection(usersCollection).doc(uid);
    await store.set(
      {
        'type': 'user',
      },
      SetOptions(merge: true),
    );
  }

  updateAthleteOffer({
    offerId,
    uid,
  }) async {
    var store = firestore.collection(usersCollection).doc(uid);
    QuerySnapshot snapshot = await firestore.collection(offersCollection).get();
    int documentIndex = -1;

    for (int i = 0; i < snapshot.docs.length; i++) {
      if (snapshot.docs[i].id == offerId) {
        documentIndex = i;
        break;
      }
    }
    await store.set(
      {
        'offerId': offerId,
        'offerName': snapshot.docs[documentIndex]['type'],
        'offerPrice': snapshot.docs[documentIndex]['price'],
        'offerDays': DateTime.now().add(
            Duration(days: int.parse(snapshot.docs[documentIndex]['days']))),
        'offerSessions': int.parse(snapshot.docs[documentIndex]['sessions']),
      },
      SetOptions(merge: true),
    );
  }

  getOfferId({type}) async {
    QuerySnapshot snapshot = await firestore
        .collection(offersCollection)
        .where('type', isEqualTo: type)
        .get();
    List<String> documentIds = snapshot.docs.map((doc) => doc.id).toList();
    if (documentIds.isEmpty) {
      return "empty";
    }

    return documentIds[0];
  }

  String formattedDate(timeStamp) {
    var dateFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
    return DateFormat('dd-MM-yyyy').format(dateFromTimeStamp);
    //Here is an example of usage of  conception of controllers
  }
}
