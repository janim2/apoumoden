import 'package:fitness/components/utils/color_constant.dart';
import 'package:fitness/pages/accepted_goal.dart';
import 'package:fitness/pages/signup.dart';
import 'package:fitness/widgets/info_banner.dart';
import 'package:flutter/material.dart';

import '../components/already_have_an_account_acheck.dart';
import 'dashboard/dashboard.dart';

class Goal extends StatelessWidget {
  const Goal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AcceptedGoal();
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InfoBanner(textonButton: "Maintain Weight"),
                    SizedBox(
                      height: 10,
                    ),
                    InfoBanner(textonButton: "Gain Weight"),
                    SizedBox(
                      height: 10,
                    ),
                    InfoBanner(textonButton: "Flat Tummy"),
                    const SizedBox(height: 10),
                    Text(
                      'We use this information to calculate an provide you with daily personalized recommendations',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Hero(
                    //   tag: "login_btn",
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) {
                    //             return Dashboard();
                    //           },
                    //         ),
                    //       );
                    //     },
                    //     child: Text(
                    //       "Login".toUpperCase(),
                    //     ),
                    //   ),
                    // ),
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
    );
  }
}
