import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/components/circle_bedge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

import '../../components/Header.dart';
import '../../components/Section.dart';
import '../../components/daily_tip.dart';
import '../../components/user_photo.dart';
import '../../components/utils/math_utils.dart';

class Sleep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Header(
                'Sleep',
                rightSide: UserPhoto(),
              ),
              // Container(
              //   color: Colors.white,
              //   padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 35.0),
              //   child: Container(
              //     padding: EdgeInsets.all(20.0),
              //     decoration: BoxDecoration(
              //       color: Color.fromRGBO(241, 227, 255, 1.0),
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: <Widget>[
              //         Text(
              //           'Body Progress',
              //           style: TextStyle(
              //             color: Color.fromRGBO(190, 130, 255, 1.0),
              //             fontSize: 18.0,
              //           ),
              //         ),
              //         Icon(
              //           Icons.camera_alt,
              //           color: Color.fromRGBO(190, 130, 255, 1.0),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal: 20.0,
                ),
                width: width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(231, 241, 248, 1.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text(
                    //   'Achivments',
                    //   style: TextStyle(
                    //     fontSize: 18.0,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(bottom: 40.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: <Widget>[
                    //       CircleBadge(
                    //         color: Color.fromRGBO(190, 130, 255, 1.0),
                    //         title: '1st',
                    //         subtitle: 'Workout',
                    //       ),
                    //       CircleBadge(
                    //         color: Color.fromRGBO(75, 142, 255, 1.0),
                    //         title: '1000',
                    //         subtitle: 'kCal',
                    //       ),
                    //       CircleBadge(
                    //         color: Color.fromRGBO(255, 255, 255, 1.0),
                    //         title: '6000',
                    //         subtitle: 'kCal',
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Text(
                      'You Slept',
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '8 hrs',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey[500],
                            ),
                          ),
                          Text(
                            'Last night',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      child: RoundedProgressBar(
                        height: 25.0,
                        style: RoundedProgressBarStyle(
                          borderWidth: 0,
                          widthShadow: 0,
                        ),
                        margin: EdgeInsets.only(
                          top: 10.0,
                          bottom: 16.0,
                        ),
                        borderRadius: BorderRadius.circular(24),
                        percent: 90.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(25.0),
                        width: width - 40.0,
                        margin: EdgeInsets.only(bottom: 30.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(241, 227, 255, 1.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Text(
                          'Wake me up in 8 hours',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(190, 130, 255, 1.0),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(
                  top: 55.0,
                  left: 20.0,
                  right: 20.0,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text(
                    //   'Sleep Tips',
                    //   style: TextStyle(
                    //     fontSize: 18.0,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("tips")
                            .snapshots(),
                        builder: (builder,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshots) {
                          var dataRef = snapshots.data;

                          if (snapshots.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshots.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }

                          if (snapshots.data!.docs.length == 0) {
                            return Text("No videos yet",
                                style: TextStyle(
                                    fontFamily: "Geometria",
                                    fontSize: 18,
                                    color: Colors.black));
                          }

                          return Section(
                            horizontalList: [
                              for (int k = 0;
                                  k <= snapshots.data!.docs.length - 1;
                                  k++)
                                if (dataRef?.docs[k]['type'] == "Sleep")
                                  Container(
                                    child: DailyTip(
                                        title: dataRef?.docs[k]['title'],
                                        image: dataRef?.docs[k]['image'],
                                        subtitle: dataRef?.docs[k]['link']),
                                  ),
                            ],
                            title: 'Sleep Tips',
                          );
                        }),
                    // Container(
                    //   height: 250.0,
                    //   width: width - 40.0,
                    //   margin: EdgeInsets.only(bottom: 30.0),
                    //   child: BezierChart(
                    //     bezierChartScale: BezierChartScale.CUSTOM,
                    //     xAxisCustomValues: const [0, 3, 6, 9],
                    //     series: const [
                    //       BezierLine(
                    //         lineColor: Color.fromRGBO(241, 227, 255, 1.0),
                    //         lineStrokeWidth: 8.0,
                    //         data: const [
                    //           DataPoint<double>(value: 45, xAxis: 0),
                    //           DataPoint<double>(value: 80, xAxis: 3),
                    //           DataPoint<double>(value: 55, xAxis: 6),
                    //           DataPoint<double>(value: 100, xAxis: 9)
                    //         ],
                    //       ),
                    //     ],
                    //     config: BezierChartConfig(
                    //       xAxisTextStyle: TextStyle(color: Colors.blueGrey),
                    //       startYAxisFromNonZeroValue: true,
                    //       backgroundColor: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   child: Row(
                    //     children: <Widget>[
                    //       Container(
                    //         height: 100.0,
                    //         margin: EdgeInsets.only(right: 15.0),
                    //         padding: EdgeInsets.all(25.0),
                    //         decoration: BoxDecoration(
                    //           color: Color.fromRGBO(231, 241, 255, 1.0),
                    //           borderRadius: BorderRadius.circular(15.0),
                    //         ),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           children: <Widget>[
                    //             Container(
                    //               child: Column(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.spaceBetween,
                    //                 children: <Widget>[
                    //                   Text(
                    //                     'Average Sleep',
                    //                     style: TextStyle(
                    //                       fontSize: 16.0,
                    //                       color: Colors.blueGrey[200],
                    //                     ),
                    //                   ),
                    //                   Text(
                    //                     '8 hrs',
                    //                     style: TextStyle(
                    //                       fontSize: 20.0,
                    //                       color: Colors.black54,
                    //                       fontWeight: FontWeight.w900,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
