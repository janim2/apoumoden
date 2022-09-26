import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/components/next_step.dart';
import 'package:fitness/components/utils/math_utils.dart';
import 'package:fitness/models/exercise.dart';
import 'package:fitness/pages/activity_timer.dart';
import 'package:fitness/widgets/toast.dart';
import 'package:flutter/material.dart';

class SupplementDetail extends StatelessWidget {
  final String image;
  final String name;
  final String dosage;
  final String purpose;
  final String description;

  SupplementDetail(
      {required this.image,
      required this.name,
      required this.dosage,
      required this.purpose,
      required this.description});

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
                  tag: "",
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.fitHeight,
                      width: size.width,
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
                        name,
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        height: 90.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(231, 241, 255, 1.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 55.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Dosage',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.blueGrey[300]),
                                  ),
                                  Text(
                                    '${dosage}x/day',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.lightBlue,
                                        fontWeight: FontWeight.w900),
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
                                    'Purpose',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.blueGrey[300],
                                    ),
                                  ),
                                  Text(
                                    purpose,
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
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueGrey,
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
            'Buy',
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
