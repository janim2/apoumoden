import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/components/utils/color_constant.dart';
import 'package:fitness/widgets/curved_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainCardPrograms extends StatelessWidget {
  final String title, time, link, image;
  final Widget widget;

  MainCardPrograms(
      {required this.title,
      required this.time,
      required this.link,
      required this.image,
      required this.widget});

  // final Map<String, String> cardInfo = {
  //   'title': '1/8 cups today',
  //   'time': 'Add 1',
  //   'image': 'assets/images/water.jpg',
  // };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 270,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                widget
              ],
            ),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.grey[400]?.withOpacity(0.95),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
          ),
        ),
        width: size.width - 40,
        height: (size.width - 40) / 2,
        margin: EdgeInsets.only(
          top: 40.0,
          left: 20.0,
          right: 20.0,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(image),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 25.0,
              offset: Offset(8.0, 8.0),
            ),
          ],
        ),
      ),
    );
  }
}
