import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/login.dart';

Future<String?> Logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  try {
    // await FirebaseAuth.instance.signOut().then((value) => () {
    prefs.clear();
    // prefs.setString("hasOnboarded", "false");
    // prefs.setString("hasLoggedin", "false");
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false);
    // Get.offNamedUntil(AppRoutes.loginRoute, (route) => false);
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}
