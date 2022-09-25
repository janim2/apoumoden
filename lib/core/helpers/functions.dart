import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

launchWhatsapp(BuildContext context, String phone) async {
  var whatsapp = "+233" + phone;
  var whatsappAndroid = Uri.parse(
      "whatsapp://send?phone=$whatsapp&text=I have an issue i would like to discuss with you");
  if (await canLaunchUrl(whatsappAndroid)) {
    await launchUrl(whatsappAndroid);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("WhatsApp is not installed on the device"),
      ),
    );
  }
}

launchCaller(String tel) async {
  var url = Uri.parse("tel:$tel");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

// launchUrl(String url_) async {
//   var url = Uri.parse(url_);
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url_);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

dateFormat(Timestamp the_date) {
  DateTime dt = (the_date).toDate();
  return DateFormat('EEEE, d MMM, yyyy').format(dt);
}

Timestamp currentTimestamp() {
  DateTime currentPhoneDate = DateTime.now(); //DateTime

  Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate); //Timestamp
  return myTimeStamp;
}

const AUTO_ID_ALPHABET =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
const AUTO_ID_LENGTH = 20;
String getAutoId() {
  final buffer = StringBuffer();
  final random = Random.secure();

  final maxRandom = AUTO_ID_ALPHABET.length;

  for (int i = 0; i < AUTO_ID_LENGTH; i++) {
    buffer.write(AUTO_ID_ALPHABET[random.nextInt(maxRandom)]);
  }
  return buffer.toString();
}

fetchUserPhone(String user_id) async {
  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user_id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      return documentSnapshot.get("phone").toString();
    });
  } on FormatException catch (e) {
    return e;
  }
}

// loadFile(asset) async {
//   PDFDocument pdf = await PDFDocument.fromAsset(asset);
//   return pdf;
// }
