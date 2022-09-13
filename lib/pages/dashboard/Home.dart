import 'package:fitness/components/daily_tip.dart';
import 'package:fitness/components/image_card_with_basic_footer.dart';
import 'package:fitness/components/image_card_with_internal.dart';
import 'package:fitness/components/main_card_programs.dart';
import 'package:fitness/components/user_photo.dart';
import 'package:fitness/components/user_tip.dart';
import 'package:fitness/components/utils/color_constant.dart';
import 'package:fitness/models/exercise.dart';
import 'package:fitness/pages/activity_detail.dart';
import 'package:fitness/widgets/alert.dart';
import 'package:fitness/widgets/popup_dialog.dart';

import 'package:flutter/material.dart';

import '../../components/Header.dart';
import '../../components/Section.dart';
import '../../components/utils/math_utils.dart';
import '../../widgets/info_banner.dart';

class Home extends StatelessWidget {
  String goal = 'Losing weight';

  final List<Exercise> exercises = [
    Exercise(
      image: 'assets/images/image001.jpg',
      title: 'Easy Start',
      time: '5 min',
      difficult: 'Low',
    ),
    Exercise(
      image: 'assets/images/image002.jpg',
      title: 'Medium Start',
      time: '10 min',
      difficult: 'Medium',
    ),
    Exercise(
      image: 'assets/images/image003.jpg',
      title: 'Pro Start',
      time: '25 min',
      difficult: 'High',
    )
  ];

  List<Widget> generateList(BuildContext context) {
    List<Widget> list = [];
    int count = 0;
    exercises.forEach((exercise) {
      Widget element = Container(
        margin: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          child: ImageCardWithBasicFooter(
            exercise: exercise,
            tag: 'imageHeader$count',
            imageWidth: 0,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return ActivityDetail(
                    exercise: exercise,
                    tag: 'imageHeader$count',
                  );
                },
              ),
            );
          },
        ),
      );
      list.add(element);
      count++;
    });
    return list;
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
                  'Home',
                  rightSide: UserPhoto(),
                ),
                SizedBox(
                  height: 10,
                ),
                InfoBanner(
                  textonButton:
                      "Complete your profile to personalize your experience",
                ),
                // Container(
                //   margin: EdgeInsets.all(25),
                //   child: Column(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             "Friday, 10th",
                //             style: TextStyle(
                //                 fontSize: 25,
                //                 color: Colors.grey,
                //                 fontFamily: "Geometria"),
                //           ),
                //           Text(
                //             "5 cups more",
                //             style: TextStyle(
                //                 color: ColorConstant.primary,
                //                 fontFamily: "Geometria"),
                //           )
                //         ],
                //       ),
                //       Align(
                //         alignment: Alignment.centerLeft,
                //         child: Text(
                //           "3 more cups to go",
                //           style: TextStyle(
                //               color: ColorConstant.primary,
                //               fontFamily: "Geometria"),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                MainCardPrograms(
                  title: '1/8 cups today',
                  time: 'Add 1',
                  image: 'assets/images/water.jpg',
                  widget: GestureDetector(
                    onTap: () {
                      showAlertDialog(
                          context,
                          "Water",
                          "Clicking continue confirms that you have drank a cup of water",
                          () {});
                    },
                    child: Icon(
                      Icons.add_box,
                      size: 32,
                      color: ColorConstant.primary,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 45.0,
                    horizontal: 30.0,
                  ),
                  child: Text(
                    'Track your weight every morning before your breakfast',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(25.0),
                  width: size.width - 40.0,
                  margin: EdgeInsets.only(bottom: 30.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(241, 227, 255, 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    'Enter today\'s weight',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(190, 130, 255, 1.0),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                // Section(
                //   title: 'Fat burning',
                //   horizontalList: this.generateList(context),
                // ),
                Section(
                  title: goal,
                  horizontalList: <Widget>[
                    ImageCardWithInternal(
                      image: 'assets/images/image001.jpg',
                      title: 'Cardio \nWorkout',
                      duration: '7 min',
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ActivityDetail(
                                  exercise: Exercise(
                                      title: "Push ups",
                                      time: "2 mins",
                                      difficult: "Easy",
                                      image: "assets/images/image001.jpg"),
                                  tag: "tag");
                            },
                          ),
                        );
                      },
                    ),
                    ImageCardWithInternal(
                      image: 'assets/images/image002.jpg',
                      title: 'Core \nWorkout',
                      duration: '7 min',
                    ),
                    ImageCardWithInternal(
                      image: 'assets/images/image003.jpg',
                      title: 'Stretch \nWorkout',
                      duration: '7 min',
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  padding: EdgeInsets.only(top: 10.0, bottom: 40.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                  ),
                  child: Column(
                    children: <Widget>[
                      // Section(
                      //   title: 'Daily Tips',
                      //   horizontalList: <Widget>[
                      //     UserTip(
                      //       image: 'assets/images/image010.jpg',
                      //       name: 'User Img',
                      //     ),
                      //     UserTip(
                      //       image: 'assets/images/image010.jpg',
                      //       name: 'User Img',
                      //     ),
                      //     UserTip(
                      //       image: 'assets/images/image010.jpg',
                      //       name: 'User Img',
                      //     ),
                      //     UserTip(
                      //       image: 'assets/images/image010.jpg',
                      //       name: 'User Img',
                      //     ),
                      //   ],
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
