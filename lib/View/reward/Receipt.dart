import 'package:flutter/material.dart';
import 'package:pj1/theme/colors.dart';
import 'package:pj1/theme/textStyle.dart';

import '../home/homeView.dart';

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
        OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => failPage()));
            },
            child: Image.asset('assets/cameraReceipt.png')),
        SizedBox(height: 47),
        Image.asset(
          'assets/line.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => bottomNavi(
                          selectedIndex: 3,
                          sendCash: 0,
                        )));
            final snackBar = SnackBar(
              backgroundColor: gray_600,
              content: Row(
                children: [
                  SizedBox(width: 20),
                  Image.asset('assets/checkIcon.png'),
                  SizedBox(width: 20),
                  Text(
                    '캐시백이 완료되었어요.',
                    style: title2(color: Colors.white),
                  ),
                ],
              ),
              duration: Duration(seconds: 2),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: Container(
                    width: 320,
                    height: 52,
                    decoration: BoxDecoration(
                      color: gray_600,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: snackBar.content),
                duration: snackBar.duration,
              ),
            );
          },
          child: Container(
              width: double.infinity,
              height: 60,
              color: Color.fromRGBO(50, 205, 109, 0.44)),
        ),
      ]),
    );
  }
}

class failPage extends StatefulWidget {
  const failPage({super.key});

  @override
  State<failPage> createState() => _failPageState();
}

class _failPageState extends State<failPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: _failtextSection(),
        ),
        SizedBox(height: 49),
        Image.asset('assets/receiptImg.png', width: 169),
        SizedBox(height: 36),
        TextButton(
            onPressed: () {}, child: Image.asset('assets/addReceipt.png')),
        SizedBox(height: 57),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: _failbutton(),
        )
      ]),
    );
  }

  Widget _failtextSection() {
    return Column(
      children: [
        Center(
          child: Text(
            "영수증 인식에 실패했어요.",
            style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 18,
                fontFamily: 'pretendard',
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 8),
        Text(
          "깨끗한 배경에 영수증을 놓고\n전체가 잘 나오도록 촬영해주세요",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xffD8D8D8),
              fontFamily: 'pretendard',
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  Widget _failbutton() {
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
            child: Text("다시 촬영하기", style: button(color: mainColor_black)),
          ),
        ],
      ),
    );
  }
}

// Widget _failtextSection() {
//   return Column(
//     children: [
//       Center(
//         child: Text(
//           "영수증 인식에 실패했어요.",
//           style: TextStyle(
//               color: Color(0xffFFFFFF),
//               fontSize: 18,
//               fontFamily: 'pretendard',
//               fontWeight: FontWeight.w600),
//         ),
//       ),
//       SizedBox(height: 8),
//       Text(
//         "깨끗한 배경에 영수증을 놓고\n전체가 잘 나오도록 촬영해주세요",
//         textAlign: TextAlign.center,
//         style: TextStyle(
//             color: Color(0xffD8D8D8),
//             fontFamily: 'pretendard',
//             fontWeight: FontWeight.w500),
//       )
//     ],
//   );
// }
