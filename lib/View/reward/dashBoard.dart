import 'package:flutter/material.dart';
import 'package:pj1/View/reward/cashBack.dart';
import 'package:pj1/View/reward/monthlyReward.dart';
import 'package:pj1/theme/colors.dart';
import 'package:pj1/theme/textStyle.dart';

class DashBoardPage extends StatefulWidget {
  int? cashPoint;
  final Key? key;
  DashBoardPage({this.key, this.cashPoint});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  int _cashPoint = 0;
  void initState() {
    super.initState();
    if (widget.cashPoint != null) {
      _cashPoint = widget.cashPoint!;
    }
  }

  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                "환경실천으로 얻은 포인트로 종량제 봉투를 구입해보세요!\n종량제 봉투를 구입한 후 영수증을 인증하면\n보유 포인트만큼 캐시백해드려요!",
                style: subtitle1(color: gray_300),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(15),
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
                            Text(
                              "내 계좌",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Main',
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_right_rounded),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/point.png"),
                      SizedBox(width: 8),
                      Text(
                        "${_cashPoint}",
                        // "test",
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
                  // const SizedBox(height: 32),
                  Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              ModalBottomSheetRoute(
                                builder: (context) => CashBack(
                                  sendCash: _cashPoint,
                                ),
                                isScrollControlled: false,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor_green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 13),
                                  child: Text(
                                    "캐시백 받기",
                                    style: button(color: mainColor_black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Image.asset(
                                'assets/collection/tooltip.png',
                                width: 100,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 9),
                  const Text(
                    "* 캐시백은 10,000포인트(=1,000원) 이상 보유 시 가능합니다.",
                    style: TextStyle(
                      color: gray_300,
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Main',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: IconButton(
                onPressed: () => Navigator.push(
                  context,
                  ModalBottomSheetRoute(
                    builder: (context) => const EntireMonthlyReward(),
                    isScrollControlled: true,
                    useSafeArea: true,
                  ),
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: gray_300,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const MonthlyReward(),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: gray_600,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: "gmarket",
        ),
      ),
    );
  }
}
