import 'package:bezier_chart/bezier_chart.dart';
import 'package:fitness/components/circle_bedge.dart';
import 'package:fitness/pages/dashboard/dashboard.dart';
import 'package:fitness/widgets/curved_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

import '../../components/Header.dart';

class AcceptedGoal extends StatelessWidget {
  var goal = 'lose weight';

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
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 25.0,
                    horizontal: 20.0,
                  ),
                  width: width,
                  decoration: BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 40.0),
                        child: Center(
                          child: CircleBadge(
                            color: Color.fromRGBO(75, 142, 255, 1.0),
                            title: 'Wow',
                            subtitle: '___',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Lose Weight',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      Text(
                        'You\'re about to $goal. Apumoden is the best app for achieving your health goal',
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CurvedButton(
                        textonButton: "Begin",
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Dashboard();
                              },
                            ),
                          );
                        },
                      )
                      // Container(
                      //   child: RoundedProgressBar(
                      //     height: 25.0,
                      //     style: RoundedProgressBarStyle(
                      //       borderWidth: 0,
                      //       widthShadow: 0,
                      //     ),
                      //     margin: EdgeInsets.only(
                      //       top: 10.0,
                      //       bottom: 16.0,
                      //     ),
                      //     borderRadius: BorderRadius.circular(24),
                      //     percent: 28.0,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
