import 'package:flutter/material.dart';
import 'package:pj1/theme/colors.dart';

class ReceiptCheck extends StatefulWidget {
  const ReceiptCheck({super.key});

  @override
  State<ReceiptCheck> createState() => _ReceiptCheckState();
}

class _ReceiptCheckState extends State<ReceiptCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor_black,
      appBar: AppBar(
        title: Text("영수증 인증"),
        backgroundColor: mainColor_black,
        elevation: 0,
      ),
    );
  }
}
