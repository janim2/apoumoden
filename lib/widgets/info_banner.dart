import 'package:flutter/material.dart';

import '../components/utils/color_constant.dart';
import '../components/utils/math_utils.dart';

class InfoBanner extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String textonButton;
  final ontap;

  // ignore: sort_constructors_first
  InfoBanner({required this.textonButton, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(15.0),
        width: size.width,
        // margin: EdgeInsets.only(bottom: 30.0),
        decoration: BoxDecoration(
          color: ColorConstant.tertiary,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          textonButton,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorConstant.primary,
            fontSize: 12.0,
            fontFamily: "Geometria",
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
