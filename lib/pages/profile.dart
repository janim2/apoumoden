// import 'package:bezier_chart/bezier_chart.dart';
import 'package:fitness/backend/auth/logout.dart';
import 'package:fitness/backend/profile/updateProfile.dart';
import 'package:fitness/components/circle_bedge.dart';
import 'package:fitness/components/utils/color_constant.dart';
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

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  DateTime selectedDate = DateTime.now();
  String userid = "";
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  bool showSpinner = false;

  TextEditingController nametextEdittingController = TextEditingController();
  TextEditingController emailTextEdittingController = TextEditingController();
  TextEditingController phoneTextEdittingController = TextEditingController();
  TextEditingController heightTextEdittingController = TextEditingController();
  TextEditingController weightTextEdittingController = TextEditingController();
  TextEditingController waterGoalTextEdittingController =
      TextEditingController();
  TextEditingController weightGoalTextEdittingController =
      TextEditingController();

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
  void initState() {
    FetchFromSharedPreferences();
    super.initState();
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
                        key: _formKey,
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
                                  controller: nametextEdittingController,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Name required';
                                    }
                                  },
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
                                    controller: emailTextEdittingController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Email required';
                                      } else if (!value.contains("@")) {
                                        return 'Enter valid email';
                                      }
                                    },
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
                                    controller: phoneTextEdittingController,
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
                                  controller: heightTextEdittingController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  cursorColor: Colors.black,
                                  onSaved: (height) {},
                                  decoration: InputDecoration(
                                    hintText: "Your height",
                                    prefixIcon: Padding(
                                        padding: EdgeInsets.all(10),
                                        child:
                                            Icon(Icons.data_saver_off_sharp)),
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
                                    controller: weightTextEdittingController,
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
                                      controller:
                                          waterGoalTextEdittingController,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "Your Water intake goal",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(10),
                                          child:
                                              Icon(Icons.data_saver_off_sharp),
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
                                      controller:
                                          weightGoalTextEdittingController,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "Your Weight",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(10),
                                          child:
                                              Icon(Icons.data_saver_off_sharp),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: SmallButton(
                            textonButton: "Update Details",
                            ontap: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                startSpinner();
                                // Do your jobs with the validated form data.

                                var reg = await UpdateProfile(context,
                                    user_id: userid,
                                    name: nametextEdittingController.text,
                                    email: emailTextEdittingController.text,
                                    phone: phoneTextEdittingController.text,
                                    height: heightTextEdittingController.text,
                                    weight:
                                        weightGoalTextEdittingController.text,
                                    dob: selectedDate,
                                    watergoal:
                                        waterGoalTextEdittingController.text,
                                    weightgoal:
                                        weightGoalTextEdittingController.text);
                                if (reg != null) {
                                  stopSpinner();
                                  showAlert(context, "error", reg.toString(),
                                      () {
                                    Navigator.of(context).pop();
                                  });
                                }
                              }
                            },
                          ))
                        ])),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: ColorConstant.secondary,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Need Help?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                            Icon(
                              Icons.help,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
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
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  Future<void> FetchFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userid = prefs.getString("user_id")!;

    // prefs.setString("profile_image", documentSnapshot.get("image"));
    nametextEdittingController.text = prefs.getString("fullname")!;
    emailTextEdittingController.text = prefs.getString("email")!;
    phoneTextEdittingController.text = prefs.getString("phone")!;
    // selectedDate prefs.getString("dob");
    // prefs.setString("goal", documentSnapshot.get("goal") ?? "");
    weightTextEdittingController.text = prefs.getString("current_weight")!;
    weightGoalTextEdittingController.text = prefs.getString("weight_goal")!;
    heightTextEdittingController.text = prefs.getString("height")!;
    waterGoalTextEdittingController.text =
        prefs.getInt("cups_per_day").toString();
  }
}
