import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DailyTip extends StatelessWidget {
  String title, subtitle, image;
  DailyTip({required this.title, required this.subtitle, required this.image});
  // final Map<String, String> element = {
  //   'title': '3 Main workout tips',
  //   'subtitle':
  //       'The American Council on Exercises (ACE) recently surveyed 3,000 ACE-certificated personal trainers about the best!',
  //   'image': 'assets/images/image011.jpg',
  // };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width * 0.80;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: width,
          height: 200.0,
          margin: EdgeInsets.only(
            right: 15.0,
            bottom: 10.0,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(image),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
        SizedBox(
          width: 310,
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        // Container(
        //   width: width,
        //   margin: EdgeInsets.only(top: 10.0),
        //   child: Text(
        //     this.element['subtitle']!,
        //     style: TextStyle(
        //       color: Colors.black45,
        //       fontSize: 14.0,
        //     ),
        //   ),
        // ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 15.0,
            ),
            child: Text(
              'More',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: Colors.lightBlue,
            ),
          ),
        ),
      ],
    );
  }
}
