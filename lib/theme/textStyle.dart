import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle title1({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 18.sp : 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Main',
      color: color);
}

TextStyle subtitle1({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 12.sp : 12,
      fontWeight: FontWeight.normal,
      fontFamily: 'Main',
      color: color);
}

TextStyle title2({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 12.sp : 12,
      fontWeight: FontWeight.bold,
      fontFamily: 'Main',
      color: color);
}

TextStyle subtitle2({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 12.sp : 12,
      fontWeight: FontWeight.normal,
      fontFamily: 'Main',
      color: color);
}

TextStyle button({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 16.sp : 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Main',
      color: color);
}
