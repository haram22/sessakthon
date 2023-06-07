import 'package:flutter/material.dart';
import 'package:pj1/View/reward/monthlyReward.dart';
import 'package:pj1/theme/colors.dart';
import 'package:pj1/theme/textStyle.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    bool trigger = false;

    return Scaffold(
      backgroundColor: mainColor_black,
      appBar: AppBar(
        title: const Text("환전소"),
        backgroundColor: mainColor_black,
        foregroundColor: mainColor_white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Center(
              child: Text(
                "환경실천으로 얻은 포인트로 종량제 봉투를 구입해보세요!\n종량제 봉투를 구입한 후 영수증을 인증하면\n보유 포인트만큼 캐시백해드려요!",
                style: subtitle1(color: gray_300),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: navigation_background,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "현재 보유 포인트",
                        style: subtitle2(color: mainColor_white),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: gray_300,
                          side: const BorderSide(color: gray_300),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("내 계좌"),
                            Icon(Icons.keyboard_arrow_right_rounded),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/point.png"),
                      const SizedBox(width: 8),
                      const Text(
                        "18,980",
                        style: TextStyle(
                          color: mainColor_green,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: "gmarket",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 23),
                  Text(
                    "지금까지 받은 캐시백: 5번, 누적 5000포인트",
                    style: title2(color: gray_300),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {},
                    onHover: (bool isHovered) {
                      if (isHovered) {
                        // 버튼에 마우스가 hover되었을 때 수행할 동작
                        setState(() {
                          trigger = true;
                        });
                      } else {
                        // 버튼에서 마우스 hover가 해제되었을 때 수행할 동작
                        setState(() {
                          trigger = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor_green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Tooltip(
                      message: "10포인트 = 1원",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            child: Text(
                              "캐시백 받기",
                              style: button(color: mainColor_black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    "* 캐시백은 10,000포인트 이상 보유 시 가능합니다.",
                    style: subtitle1(color: gray_300),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const MonthlyReward(),
          ],
        ),
      ),
    );
  }
}
