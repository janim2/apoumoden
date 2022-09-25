import 'package:fitness/components/utils/color_constant.dart';
import 'package:fitness/pages/accepted_goal.dart';
import 'package:fitness/pages/signup.dart';
import 'package:fitness/widgets/info_banner.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../backend/auth/updateGoal.dart';
import '../components/already_have_an_account_acheck.dart';
import 'dashboard/dashboard.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  GoalScreenState createState() => GoalScreenState();
}

class GoalScreenState extends State<GoalScreen> {
  String goal = "";

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

  moveAction() {
    startSpinner();
    UpdateGoal(context, goal: goal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Text(
                  "Select your goal",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: ColorConstant.primary,
                      fontFamily: "Geometria"),
                ),
                Text(
                  "Apoumoden",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    const Spacer(),
                    // Expanded(
                    //   flex: 8,
                    //   child: SvgPicture.asset("assets/icons/login.svg"),
                    // ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      InfoBanner(
                        textonButton: "Lose Weight",
                        ontap: () {
                          goal = "Lose Weight";
                          moveAction();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InfoBanner(
                        textonButton: "Maintain Weight",
                        ontap: () {
                          goal = "Maintain Weight";
                          moveAction();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InfoBanner(
                        textonButton: "Gain Weight",
                        ontap: () {
                          goal = "Gain Weight";
                          moveAction();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InfoBanner(
                        textonButton: "Flat Tummy",
                        ontap: () {
                          goal = "Flat Tummy";
                          moveAction();
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'We use this information to calculate an provide you with daily personalized recommendations',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                      const SizedBox(height: 20),

                      const SizedBox(height: 10),
                      // AlreadyHaveAnAccountCheck(
                      //   press: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) {
                      //           return SignUpScreen();
                      //         },
                      //       ),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
