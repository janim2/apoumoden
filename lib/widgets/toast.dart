import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../components/utils/color_constant.dart';

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

void showAlert(
    BuildContext context, String title, String message, final ontap) {
  alert(context,
      title: title == "error"
          ? Text(title, style: TextStyle(color: Colors.red, fontFamily: "Sora"))
          : Text(title,
              style: TextStyle(color: Colors.green, fontFamily: "Sora")),
      content: Text(message),
      textOK: GestureDetector(
          onTap: ontap,
          child: Text(
            "OK",
            style: TextStyle(color: Colors.black, fontFamily: "Sora"),
          )));
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(
          color: ColorConstant.primary,
        ),
        Container(margin: EdgeInsets.only(left: 8), child: Text("Loading...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showTwoButtonAlertDialog(
    BuildContext context,
    String title,
    String message,
    String canceltext,
    String approvetext,
    final cancelAlert,
    final approveAlert) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(
      "$canceltext",
      style: TextStyle(fontFamily: "quicksand_regular", color: Colors.black),
    ),
    onPressed: cancelAlert,
  );
  Widget continueButton = TextButton(
    child: Text(
      "$approvetext",
      style: TextStyle(fontFamily: "quicksand_regular", color: Colors.black),
    ),
    onPressed: approveAlert,
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "$title",
      style: TextStyle(fontFamily: "quicksand_bold", color: Colors.black),
    ),
    content: Text(
      "$message",
      style: TextStyle(fontFamily: "quicksand_medium", color: Colors.black),
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
