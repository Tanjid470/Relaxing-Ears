import 'package:flutter/material.dart';

TextStyle HeadText(textColor, double d) {
  return TextStyle(
      color: textColor,
      fontSize: 22,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400);
}

TextStyle Head24Text(textColor) {
  return TextStyle(
      color: textColor,
      fontSize: 24,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w400);
}

TextStyle Head9Text(textColor) {
  return TextStyle(
      color: textColor,
      fontSize: 9,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w500);
}

TextStyle Head20Text(Color textColor, double fontsize) {
  return TextStyle(
      color: textColor,
      fontSize: fontsize,
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w500);
}

TextStyle SubText(Color textColor, double fontsize) {
  return TextStyle(
      color: textColor,
      fontSize: fontsize,
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.w500);
}
