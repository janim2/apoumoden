import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color primary = fromHex('#1C6758');

  static Color secondary = fromHex('#3D8361');

  static Color tertiary = fromHex('#D6CDA4');

  static Color other = fromHex('#EEF2E6');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
