import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/pages/login.dart';
import 'package:flutter/material.dart';

import '../../widgets/toast.dart';

Future<String?> SignUp(BuildContext context,
    {required String email, required String password}) async {
  String errorMessage = "";
  String user_id = "";

  try {
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.trim(), password: password);

    user_id = result.user!.uid;

    var userAdd = await addUser(context, "", user_id, email, password);
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "invalid-email":
        errorMessage = "Your email appears to be malformed.";
        break;
      case "email-already-in-use":
        errorMessage = "Email already exists.";
        break;
      case "unknown":
        errorMessage = "Something unexcepted happened";
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = "User with this email has been disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Too many requests. Try again later.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }
    return (errorMessage);
  }
}

addUser(BuildContext context, String profile_image, String user_id,
    String email, String password) async {
  DocumentReference documentReferencer =
      FirebaseFirestore.instance.collection("users").doc(user_id);

  Map<String, dynamic> data = <String, dynamic>{
    "image": profile_image.isEmpty ? "" : profile_image,
    "user_id": user_id,
    "fullname": "",
    "email": email,
    "phone": "",
    "goal": "",
    "cups_per_day": 8,
    "cups_drank_today": 0,
    "weight_goal": "",
    "current_weight": "",
    "height": "",
    "dob": ""
  };

  await documentReferencer
      .set(data)
      .then((value) => success(context))
      .catchError((e) => print(e));
}

success(BuildContext context) {
  showToast("Sign In to Continue");
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false);
}
