import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/components/utils/color_constant.dart';
import 'package:flutter/material.dart';

class ImageCardWithInternal extends StatelessWidget {
  final String image, title, duration;
  final ontap;

  const ImageCardWithInternal(
      {Key? key,
      required this.image,
      required this.title,
      required this.duration,
      this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                this.duration,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: Colors.black.withAlpha(900),
              ),
            ),
            Text(
              this.title,
              style: TextStyle(
                color: ColorConstant.primary,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        width: size.width * 0.85,
        height: size.width * 0.60,
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.only(right: 15.0, bottom: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
                image.toString()), //AssetImage(this.image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
