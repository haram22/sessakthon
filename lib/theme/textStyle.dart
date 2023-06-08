import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle title1({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 18.sp : 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'gmarket',
      color: color);
}

TextStyle subtitle1({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 12.sp : 12,
      fontWeight: FontWeight.normal,
      fontFamily: 'pretendard',
      color: color);
}

TextStyle title2({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 12.sp : 12,
      fontWeight: FontWeight.bold,
      fontFamily: 'pretendard',
      color: color);
}

TextStyle subtitle2({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 12.sp : 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'pretendard',
      color: color);
}

TextStyle button({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 16.sp : 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'gmarket',
      color: color);
}

TextStyle landingTitle({bool responsible = false, Color? color}) {
  return TextStyle(
      fontSize: responsible ? 14.sp : 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'pretendart',
      height: 1.5,
      color: color);
}
