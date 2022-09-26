import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/components/next_step.dart';
import 'package:fitness/components/utils/math_utils.dart';
import 'package:fitness/models/exercise.dart';
import 'package:fitness/pages/activity_timer.dart';
import 'package:fitness/widgets/toast.dart';
import 'package:flutter/material.dart';

class ActivityDetail extends StatelessWidget {
  final String tag;
  final Exercise exercise;

  ActivityDetail({
    required this.exercise,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: this.tag,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: CachedNetworkImage(
                      imageUrl: this.exercise.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.exercise.title,
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(231, 241, 255, 1.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 50.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Time',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 14.0,
                                        color: Colors.blueGrey[300]),
                                  ),
                                  SizedBox(
                                    width: size.width / 3,
                                    child: Text(
                                      '${this.exercise.time}',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 45.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Intensity',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.blueGrey[300],
                                    ),
                                  ),
                                  Text(
                                    this.exercise.difficult,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 15.0),
                      //   child: Column(
                      //     children: <Widget>[
                      //       NextStep(
                      //         image: 'assets/images/image005.jpg',
                      //         title: 'Plank',
                      //         seconds: 50,
                      //       ),
                      //       NextStep(
                      //         image: 'assets/images/image006.jpg',
                      //         title: 'Push-ups',
                      //         seconds: 50,
                      //       ),
                      //       NextStep(
                      //         image: 'assets/images/image007.jpg',
                      //         title: 'Lateral Raise',
                      //         seconds: 50,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(100, 140, 255, 1.0),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(100, 140, 255, 0.5),
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0),
                ),
              ]),
          child: Text(
            'Start',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          showToast("This feature would be added in subsequent versions");
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (_) {
          //     return ActivityTimer(image:'assets/images/image001.jpg', tag: 'imageHeader');
          //   }),
          // );
        },
      ),
    );
  }
}
