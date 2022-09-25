import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/core/helpers/functions.dart';
import 'package:fitness/pages/contratulationsPage.dart';
import 'package:fitness/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> UpdateWaterDrunk(BuildContext context,
    {required String user_id,
    required int cups_drank_today,
    required int cups_per_day}) async {
  //CHECK IF MAXIMUM CUPS HAS BEEN DRUNK

  if (cups_drank_today <= cups_per_day) {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection("water").doc(getAutoId());

    Map<String, dynamic> data = <String, dynamic>{
      "user_id": user_id,
      "drank_at": currentTimestamp(),
      "date": dateFormat(currentTimestamp())
    };

    await documentReferencer
        .set(data)
        .then((value) =>
            success(context, user_id, cups_drank_today, cups_per_day))
        .catchError((e) => print(e));
  } else {
    updateCupsDrank(0, user_id);
    Navigator.of(context).pop();
  }
}

Future<String?> updateCupsDrank(int cups, String user_id) async {
  //CHECK IF MAXIMUM CUPS HAS BEEN DRUNK
  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("users").doc(user_id);

  Map<String, dynamic> data = <String, dynamic>{
    "cups_drank_today": cups,
  };

  await documentReferencer.update(data).catchError((e) => print(e));
}

success(BuildContext context, String userid, int cups_drank_today,
    int cups_per_day) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(cups_drank_today);
  cups_drank_today = cups_drank_today + 1;
  prefs.setInt("cups_drank_today", cups_drank_today);
  if (cups_drank_today == cups_per_day) {
    prefs.setInt("cups_drank_today", 0);
    //NAVIGATE TO WATER COMPLETED PAGE
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CongratulationsPage(
            "You have completed your water goal for the day")));
  } else {
    Navigator.of(context).pop();
    showToast("Goal updated successful");
    updateCupsDrank(cups_drank_today, userid);
  }
}
