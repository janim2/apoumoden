import 'package:flutter/material.dart';

import '../components/utils/color_constant.dart';
import '../components/utils/math_utils.dart';

class SmallButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  String textonButton;
  final ontap;

  // ignore: sort_constructors_first
  SmallButton({required this.textonButton, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "login_btn",
      child: ElevatedButton(
        onPressed: ontap,
        child: Text(
          "$textonButton".toUpperCase(),
        ),
      ),
    );
  }
}
