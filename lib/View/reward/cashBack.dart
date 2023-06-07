import 'package:flutter/material.dart';
import 'package:pj1/View/reward/Receipt.dart';
import 'package:pj1/theme/colors.dart';
import 'package:pj1/theme/textStyle.dart';

class CashBack extends StatelessWidget {
  const CashBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor_black,
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: navigation_background,
                ),
                child: const Text(
                  "KB국민은행 93930200771794",
                  style: TextStyle(
                    color: gray_300,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 23),
            Text.rich(
              TextSpan(
                text: "1,898원",
                style: title1(color: mainColor_green),
                children: [
                  TextSpan(
                    text: "을 캐시백 받으시겠습니까?",
                    style: title1(color: mainColor_white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 27),
            Image.asset("assets/graphic.png"),
            const SizedBox(height: 15),
            Text(
              "잔여 포인트 : 0",
              style: subtitle1(color: gray_300),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReceiptCheck()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor_green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    child: Text(
                      "확인",
                      style: button(color: mainColor_black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
