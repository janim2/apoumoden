import 'package:fitness/components/daily_tip.dart';
import 'package:fitness/components/image_card_with_basic_footer.dart';
import 'package:fitness/components/image_card_with_internal.dart';
import 'package:fitness/components/main_card_programs.dart';
import 'package:fitness/components/user_photo.dart';
import 'package:fitness/components/user_tip.dart';
import 'package:fitness/models/exercise.dart';
import 'package:fitness/pages/activity_detail.dart';

import 'package:flutter/material.dart';

import '../../components/Header.dart';
import '../../components/Section.dart';
import '../../components/utils/color_constant.dart';
import '../../widgets/info_banner.dart';

class Supplements extends StatelessWidget {
  final String goal = 'Weight loss';

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
                ImageCardWithInternal(
                  image: 'assets/images/supplements.png',
                  title: 'Calcium',
                  duration: '2x/day',
                ),
                ImageCardWithInternal(
                  image: 'assets/images/supplements.png',
                  title: 'Guar gum',
                  duration: '1x/day',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
