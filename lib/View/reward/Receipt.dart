import 'package:flutter/material.dart';
import 'package:pj1/theme/colors.dart';
import 'package:pj1/theme/textStyle.dart';

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
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_rounded),
        ),
        centerTitle: true,
        title: Text("영수증 인증", style: landingTitle()),
        backgroundColor: mainColor_black,
        elevation: 0,
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: _textSection(),
        ),
        SizedBox(height: 49),
        Image.asset('assets/receiptImg.png', width: 169),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: _button(),
        )
      ]),
    );
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ReceiptCheck()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: mainColor_green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "영수증 촬영하기",
              style: button(color: mainColor_black),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _textSection() {
  return Column(
    children: [
      Center(
        child: Text(
          "영수증 인식이 필요해요.",
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 18,
              fontFamily: 'pretendard',
              fontWeight: FontWeight.w600),
        ),
      ),
      SizedBox(height: 8),
      Text(
        "종량제 봉투를 구매한 영수증을\n사진으로 촬영하세요",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Color(0xffD8D8D8),
            fontFamily: 'pretendard',
            fontWeight: FontWeight.w500),
      )
    ],
  );
}
