// import 'package:bezier_chart/bezier_chart.dart';
import 'package:fitness/backend/auth/logout.dart';
import 'package:fitness/backend/profile/updateProfile.dart';
import 'package:fitness/components/circle_bedge.dart';
import 'package:fitness/components/utils/color_constant.dart';
import 'package:fitness/core/helpers/functions.dart';
import 'package:fitness/widgets/curved_button.dart';
import 'package:fitness/widgets/small_button.dart';
import 'package:fitness/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/Header.dart';

class HelpPage extends StatefulWidget {
  HelpPageState createState() => HelpPageState();
}

class HelpPageState extends State<HelpPage> {
  DateTime selectedDate = DateTime.now();
  String userid = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool showSpinner = false;

  void stopSpinner() {
    setState(() {
      showSpinner = false;
    });
  }

  void startSpinner() {
    setState(() {
      showSpinner = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 20.0),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(23.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: ColorConstant.primary,
                            size: 40,
                          ),
                        ),
                      ),
                      Header('HelpLine', rightSide: Text("")),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 45.0,
                      horizontal: 30.0,
                    ),
                    child: Text(
                      'These are a list of dieticians who are ever ready to help. Reach out if you have any issues',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Column(children: [
                      contactCard("NutriDi (Nutrition and Dietetics Consult)",
                          "+233(0)239 251 514", () {
                        launchCaller("+233 239 251 514");
                      }),
                      contactCard("Ark Medical Centre", "+233 302 941 734", () {
                        launchCaller('+233 302 941 734');
                      }),
                      contactCard("RdSali Nutrition", "+233(0)548 735 434", () {
                        launchCaller('+233 548 735 434');
                      }),
                      contactCard("DietLine Clinic", "+233(0)244 694 451", () {
                        launchCaller('+233 244 694 451');
                      }),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget contactCard(String orgname, String phone, ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orgname,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blueGrey,
              ),
            ),
            Text(
              phone,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.blueGrey[300],
              ),
            ),
            Divider(
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
