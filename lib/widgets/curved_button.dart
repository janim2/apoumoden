import 'package:flutter/material.dart';

import '../components/utils/color_constant.dart';
import '../components/utils/math_utils.dart';

class CurvedButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String textonButton;
  var width;
  final ontap;

  // ignore: sort_constructors_first
  CurvedButton({required this.textonButton, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          margin: EdgeInsets.all(5),
          width: size.width,
          height: 50,
          decoration: BoxDecoration(
              color: ColorConstant.other,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              border: Border.all(color: ColorConstant.secondary)),
          child: Center(
              child: Text(
            "$textonButton",
            style: TextStyle(
                fontFamily: "Sora", fontSize: 20, color: ColorConstant.primary),
          ))),
    );
  }
}
