import 'package:fitness/pages/dashboard/dashboard.dart';
import 'package:fitness/pages/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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




