import 'package:fitness/components/utils/color_constant.dart';
import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String title, String message, ontap) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(child: Text("Continue"), onPressed: ontap);

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: TextStyle(color: ColorConstant.secondary),
    ),
    content: Text(
      message,
      style: TextStyle(color: ColorConstant.primary),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
