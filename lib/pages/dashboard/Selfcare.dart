import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/components/daily_tip.dart';
import 'package:fitness/components/image_card_with_basic_footer.dart';
import 'package:fitness/components/image_card_with_internal.dart';
import 'package:fitness/components/main_card_programs.dart';
import 'package:fitness/components/user_photo.dart';
import 'package:fitness/components/user_tip.dart';
import 'package:fitness/components/utils/color_constant.dart';
import 'package:fitness/models/exercise.dart';
import 'package:fitness/pages/activity_detail.dart';

import 'package:flutter/material.dart';

import '../../components/Header.dart';
import '../../components/Section.dart';
import '../../components/utils/math_utils.dart';
import '../../widgets/info_banner.dart';

class Selfcare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                Header(
                  'Selfcare',
                  rightSide: UserPhoto(),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "We are concerned about you. These self care tips would help you look young",
                    style: TextStyle(
                        color: ColorConstant.primary,
                        fontFamily: "Geometria",
                        fontSize: 13),
                  ),
                ),

                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("videos")
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
                            Container(
                              child: MainCardPrograms(
                                title: dataRef?.docs[k]['title'],
                                link: dataRef?.docs[k]['title'],
                                time: "",
                                image: dataRef?.docs[k]['thumbnil'],
                                widget: Text(""),
                              ),
                            ),
                        ],
                        title: 'Selfcare Videos',
                      );
                    }),
                // MainCardPrograms(
                //   title: 'Videos',
                //   time: 'Add 1',
                //   image: 'assets/images/videos.jpg',
                //   widget: Text(""),
                // ),
                // MainCardPrograms(
                //   title: 'Videos',
                //   time: 'Add 1',
                //   image: 'assets/images/videos.jpg',
                //   widget: Text(""),
                // ),

                // MainCard

                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  padding: EdgeInsets.only(top: 10.0, bottom: 40.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                  ),
                  child: Column(
                    children: <Widget>[
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
                                  if (dataRef?.docs[k]['type'] == "Selfcare")
                                    Container(
                                      width: size.width,
                                      child: DailyTip(
                                          title: dataRef?.docs[k]['title'],
                                          image: dataRef?.docs[k]['image'],
                                          subtitle: dataRef?.docs[k]['link']),
                                    ),
                              ],
                              title: 'Selfcare Videos',
                            );
                          }),
                      // Section(
                      //   horizontalList: <Widget>[
                      //     DailyTip(),
                      //     DailyTip(),
                      //     DailyTip(),
                      //   ],
                      //   title: 'Selfcare Tips',
                      // ),
                    ],
                  ),
                ),
                // MainCardPrograms(
                //   title: 'Skin Care',
                //   time: 'Add 1',
                //   image: 'assets/images/image001.jpg',
                //   widget: Text(""),
                // ), //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
