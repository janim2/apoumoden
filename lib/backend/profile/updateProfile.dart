import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/core/helpers/functions.dart';
import 'package:fitness/pages/contratulationsPage.dart';
import 'package:fitness/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> UpdateProfile(BuildContext context,
    {required String user_id,
    required String name,
    required String email,
    phone,
    height,
    weight,
    required DateTime dob,
    watergoal,
    weightgoal}) async {
  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("users").doc(user_id);

  Map<String, dynamic> data = <String, dynamic>{
    "fullname": name,
    "email": email,
    "phone": phone,
    "cups_per_day": watergoal,
    "weight_goal": weightgoal,
    "current_weight": weight,
    "height": height,
    "dob": dob
  };

  await documentReferencer
      .update(data)
      .then((value) => success(context, name, email, phone, height, weight, dob,
          watergoal, weightgoal))
      .catchError((e) => print(e));
}

success(
    BuildContext context,
    String name,
    String email,
    String phone,
    String height,
    String weight,
    DateTime dob,
    String watergoal,
    String weightgoal) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("fullname", name);
  prefs.setString("email", email);
  prefs.setString("phone", phone);
  prefs.setString("weight_goal", weightgoal);
  prefs.setString("height", height);
  prefs.setString("dob", dob.toString());
  prefs.setString("current_weight", weight);

  prefs.setInt("cups_per_day", int.parse(watergoal));
  Navigator.of(context).pop();
  showToast("Profile updated successful");
}
