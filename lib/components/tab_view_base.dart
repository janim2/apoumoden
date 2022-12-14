import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/components/image_card_with_basic_footer.dart';
import 'package:fitness/data/Dishes.dart';
import 'package:fitness/models/exercise.dart';
import 'package:fitness/pages/app_goal.dart';
import 'package:fitness/pages/food_detail.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabViewBase extends StatefulWidget {
  final String tabName;

  TabViewBase({required this.tabName});

  TabViewBaseState createState() => TabViewBaseState();
}

class TabViewBaseState extends State<TabViewBase> {
  String goal = "";

  Exercise exercise = Exercise(
    image: "assets/images/image012.jpg",
    title: "Dish 01",
    time: "25 min",
    difficult: "426 kCal",
  );

  // List<Widget> _renderItem(Size size) {
  //   return List<Widget>.generate(dishes.length, (index) {
  //     var tag = dishes[index]['title'] + index.toString();
  //     Exercise exercise = Exercise(
  //       image: dishes[index]['image'],
  //       title: dishes[index]['title'],
  //       time: dishes[index]['time'],
  //       difficult: dishes[index]['calories'],
  //     );
  //     return Container(
  //       margin: EdgeInsets.symmetric(vertical: 20.0),
  //       child: ImageCardWithBasicFooter(
  //         exercise: exercise,
  //         tag: tag,
  //         imageWidth: size.width,
  //       ),
  //     );
  //   });
  // }

  @override
  void initState() {
    FetchFromSharedPreferences();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: size.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(219, 228, 255, 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Change Goal', // + widget.tabName + goal,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromRGBO(122, 158, 255, 1.0),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => GoalScreen()),
                      );
                    },
                    child: Icon(
                      Icons.replay_circle_filled_outlined,
                      size: 25.0,
                      color: Color.fromRGBO(122, 158, 255, 1.0),
                    ),
                  )
                ],
              ),
            ),
            Column(children: [
              SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection("food").snapshots(),
                  builder: (builder,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshots) {
                    var dataRef = snapshots.data;

                    if (snapshots.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshots.data!.docs.length == 0) {
                      return Text("No ${widget.tabName} for $goal",
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
                          // goal == 'Gain Weight' ? goal == 'Lose Weight' : goal = goal
                          if (dataRef?.docs[k]['goal'] == goal &&
                              dataRef?.docs[k]['time_of_day'] == widget.tabName)
                            Container(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return FoodDetail(
                                            image: dataRef?.docs[k]['image'],
                                            name: dataRef?.docs[k]['title'],
                                            preptime: dataRef?.docs[k]['time'],
                                            calories: dataRef?.docs[k]
                                                ['calories'],
                                            description:
                                                "Recipe would be uploaded soon");
                                      },
                                    ),
                                  );
                                },
                                child: ImageCardWithBasicFooter(
                                  exercise: Exercise(
                                    image: dataRef?.docs[k]['image'],
                                    title: dataRef?.docs[k]['title'],
                                    time: dataRef?.docs[k]['time'],
                                    difficult:
                                        "${dataRef?.docs[k]['calories']} kCal",
                                  ),
                                  tag: "4",
                                  imageWidth: size.width,
                                ),
                              ),
                            ),
                      ],
                    );
                  }),
              // ImageCardWithBasicFooter(
              //   exercise: exercise,
              //   tag: "4",
              //   imageWidth: size.width,
              // ),
              // ImageCardWithBasicFooter(
              //   exercise: exercise,
              //   tag: "4",
              //   imageWidth: size.width,
              // ),
            ]),
          ],
        ),
      ),
    );
  }

  FetchFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    goal = prefs.getString("goal")!;
  }
}
