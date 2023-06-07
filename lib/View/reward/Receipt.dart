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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
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
        SizedBox(height: 36),
        TextButton(
            onPressed: () {}, child: Image.asset('assets/addReceipt.png')),
        SizedBox(height: 57),
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
            context, MaterialPageRoute(builder: (context) => cameraReceipt()));
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

class cameraReceipt extends StatefulWidget {
  const cameraReceipt({super.key});

  @override
  State<cameraReceipt> createState() => _cameraReceiptState();
}

class _cameraReceiptState extends State<cameraReceipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor_black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: mainColor_black,
          ),
        ),
        centerTitle: true,
        title: Text("영수증 인증", style: landingTitle(color: mainColor_black)),
        backgroundColor: Color.fromRGBO(50, 205, 109, 0.44),
        elevation: 0,
      ),
      body: Column(children: [
        Image.asset(
          'assets/line.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Stack(
          children: [
            Image.asset(
              'assets/gradation.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "영수증의 종량제 구매 정보를 읽어오는 중입니다.",
                  style: landingTitle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        Image.asset('assets/cameraReceipt.png'),
        SizedBox(height: 47),
        Image.asset(
          'assets/line.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
            width: double.infinity,
            height: 60,
            color: Color.fromRGBO(50, 205, 109, 0.44)),
        // Image.asset(
        //   'assets/gradationRect.png',
        //   width: double.infinity,
        //   height: 10,
        //   fit: BoxFit.fill,
        // ),
      ]),
    );
  }
}
