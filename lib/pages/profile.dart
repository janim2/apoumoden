// import 'package:bezier_chart/bezier_chart.dart';
import 'package:fitness/backend/auth/logout.dart';
import 'package:fitness/components/circle_bedge.dart';
import 'package:fitness/components/utils/color_constant.dart';
import 'package:fitness/widgets/curved_button.dart';
import 'package:fitness/widgets/small_button.dart';
import 'package:fitness/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

import '../../components/Header.dart';

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  DateTime selectedDate = DateTime.now();

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1850, 8),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20.0),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Header(
                  'Profile',
                  rightSide: Text(""),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 45.0,
                    horizontal: 30.0,
                  ),
                  child: Text(
                    'Your personal preferences help us personalize your experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Form(
                      child: Column(children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Full name",
                            style: TextStyle(fontFamily: "Geometria"),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            onSaved: (height) {},
                            decoration: InputDecoration(
                              hintText: "Your Name",
                              prefixIcon: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(Icons.person)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Email",
                            style: TextStyle(fontFamily: "Geometria"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: "Your Email",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(Icons.email),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Phone number",
                            style: TextStyle(fontFamily: "Geometria"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: "Your Phone",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(Icons.phone),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Height",
                            style: TextStyle(fontFamily: "Geometria"),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            onSaved: (height) {},
                            decoration: InputDecoration(
                              hintText: "Your height",
                              prefixIcon: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(Icons.data_saver_off_sharp)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Weight",
                            style: TextStyle(fontFamily: "Geometria"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                hintText: "Your Weight",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(Icons.data_saver_off_sharp),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Date of birth",
                            style: TextStyle(fontFamily: "Geometria"),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: InkWell(
                                onTap: () {
                                  selectDate(context);
                                },
                                child: Text(
                                  selectedDate.toString(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )

                              // TextFormField(
                              //   keyboardType: TextInputType.datetime,
                              //   textInputAction: TextInputAction.done,
                              //   cursorColor: Colors.black,
                              //   decoration: InputDecoration(
                              //     hintText: "Your D.O.B",
                              //     prefixIcon: Padding(
                              //       padding: EdgeInsets.all(10),
                              //       child: Icon(Icons.data_saver_off_sharp),
                              //     ),
                              //   ),
                              // ),
                              ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Water - Goal (cup)",
                              style: TextStyle(fontFamily: "Geometria"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: "Your Water intake goal",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.data_saver_off_sharp),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Weight - Goal",
                              style: TextStyle(fontFamily: "Geometria"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: "Your Weight",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(Icons.data_saver_off_sharp),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(child: SmallButton(textonButton: "Update Details"))
                  ])),
                ),
                InkWell(
                  onTap: () {
                    showTwoButtonAlertDialog(
                        context,
                        "Logout",
                        "Are you sure you want to logout?",
                        "Stay",
                        "Logout",
                        () {}, () {
                      Logout(context);
                    });
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 35.0),
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                          Icon(
                            Icons.logout_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
