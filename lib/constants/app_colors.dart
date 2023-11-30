import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();
  static const primary = Color(0XFF292D49);
  static const secondary = Color(0XFF917FB3);
  static const tertiary = Color(0XFFE5BEEC);
  static const accent = Color(0XFFFDE2F3);
  static const offpink = Color(0xffFDE2F3);
  static const black = Color(0xff070808);
  static const bule = Color(0xff917FB3);
  static const white = Colors.white;
  static const listcolor = Color(0xff3b3a57);
  static const gray=Color.fromARGB(255, 187, 185, 185);

  static const test = Color.fromARGB(255, 142, 154, 235);
  static const secondcolor = Color.fromARGB(255, 179, 148, 236);

  static const headerText =
      TextStyle(color: accent, fontWeight: FontWeight.bold, fontSize: 25);
  static const subTitleText =
      TextStyle(color: tertiary, fontWeight: FontWeight.w400, fontSize: 18);

  static Gradient bgGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF292D49),
      Color(0xFF000000), // black
    ],
  );
}
