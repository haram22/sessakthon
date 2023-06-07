import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle title1({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 18.sp : 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'gmarket',
      color: color);
}

TextStyle subtitle1({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 12.sp : 12,
      fontWeight: FontWeight.normal,
      fontFamily: 'pretendart',
      color: color);
}

TextStyle title2({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 12.sp : 12,
      fontWeight: FontWeight.bold,
      fontFamily: 'pretendart',
      color: color);
}

TextStyle subtitle2({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 12.sp : 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'pretendart',
      color: color);
}

TextStyle button({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 16.sp : 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'gmarket',
      color: color);
}
