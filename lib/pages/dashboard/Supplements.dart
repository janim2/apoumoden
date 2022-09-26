import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/components/daily_tip.dart';
import 'package:fitness/components/image_card_with_basic_footer.dart';
import 'package:fitness/components/image_card_with_internal.dart';
import 'package:fitness/components/main_card_programs.dart';
import 'package:fitness/components/user_photo.dart';
import 'package:fitness/components/user_tip.dart';
import 'package:fitness/models/exercise.dart';
import 'package:fitness/pages/activity_detail.dart';
import 'package:fitness/pages/supplement_detail.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/Header.dart';
import '../../components/Section.dart';
import '../../components/utils/color_constant.dart';
import '../../widgets/info_banner.dart';

class Supplements extends StatefulWidget {
  @override
  SupplementsState createState() => SupplementsState();
}

class SupplementsState extends State<Supplements> {
  String goal = '';

  @override
  void initState() {
    FetchFromSharedPreferences();
    super.initState();
  }

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
                  'Supplements',
                  rightSide: UserPhoto(),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Supplements to help in your $goal",
                    style: TextStyle(
                        color: ColorConstant.primary,
                        fontFamily: "Geometria",
                        fontSize: 13),
                  ),
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("supplements")
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
                        return Text("No supplements yet",
                            style: TextStyle(
                                fontFamily: "Geometria",
                                fontSize: 18,
                                color: Colors.black));
                      }

                      return Column(
                        children: [
                          for (int k = 0;
                              k <= snapshots.data!.docs.length - 1;
                              k++)
                            if (dataRef?.docs[k]['goal'] == goal)
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return SupplementDetail(
                                              image: dataRef?.docs[k]['image'],
                                              name: dataRef?.docs[k]['title'],
                                              dosage: dataRef?.docs[k]
                                                  ['dosage'],
                                              purpose: dataRef?.docs[k]['goal'],
                                              description: dataRef?.docs[k]
                                                  ['description']);
                                        },
                                      ),
                                    );
                                  },
                                  child: ImageCardWithInternal(
                                    image: dataRef?.docs[k]['image'],
                                    title: dataRef?.docs[k]['title'],
                                    duration:
                                        '${dataRef?.docs[k]['dosage']}x/day',
                                  ),
                                ),
                              ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> FetchFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      goal = prefs.getString("goal")!;
    });
  }
}
