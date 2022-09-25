import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/pages/app_goal.dart';
import 'package:fitness/pages/dashboard/dashboard.dart';
import 'package:fitness/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String hasLoggedIn = prefs.getString("hasLoggedin").toString();
  String hasSelectedGoal = prefs.getString("hasSelectedGoal").toString();

  if (hasLoggedIn == "true" && hasSelectedGoal == "true") {
    runApp(HomePage());
  } else if (hasLoggedIn == "true" && hasSelectedGoal == "false") {
    runApp(SelectGoal());
  } else {
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Geometria'),
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

class SelectGoal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Geometria'),
      home: Scaffold(
        body: GoalScreen(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Geometria'),
      home: Scaffold(
        body: Dashboard(),
      ),
    );
  }
}
