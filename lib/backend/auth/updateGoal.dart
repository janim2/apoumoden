import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/accepted_goal.dart';
import '../../widgets/toast.dart';

Future<String?> UpdateGoal(BuildContext context, {required String goal}) async {
  final User? currentUser = await FirebaseAuth.instance.currentUser;

  String user_id = currentUser!.uid;

  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("users").doc(user_id);

  Map<String, dynamic> data = <String, dynamic>{
    "goal": goal,
  };

  await documentReferencer
      .update(data)
      .then((value) => success(context, goal))
      .catchError((e) => print(e));
}

success(BuildContext context, String goal) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("goal", goal);
  prefs.setString("hasSelectedGoal", "true");

  showToast("Goal updated successful");
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => AcceptedGoal(goal)),
      (Route<dynamic> route) => false);
}
