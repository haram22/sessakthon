import 'package:flutter/material.dart';
import 'package:pj1/theme/colors.dart';
import 'package:pj1/theme/textStyle.dart';

List<Item> data = generateItems(30);

class MonthlyReward extends StatelessWidget {
  const MonthlyReward({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "이번 달 포인트 기록",
          style: title1(color: mainColor_green),
        ),
        const SizedBox(height: 20),
        const Text(
          "날짜                          획득 포인트                         환경 실천",
          style: TextStyle(
            color: mainColor_white,
            fontSize: 10,
            fontFamily: "gmarket",
          ),
        ),
        const SizedBox(height: 16),
        for (int i = 0; i < 4; i++)
          Column(
            children: [
              Text(
                "${data[i].date}                  ${data[i].point}                                 ${data[i].action}",
                style: const TextStyle(
                  color: gray_300,
                  fontSize: 10,
                  fontFamily: "gmarket",
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
      ],
    );
  }
}

class Item {
  Item({
    required this.date,
    required this.point,
    required this.action,
  });

  String date;
  String point;
  String action;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      date: '5월 30일',
      point: '326P',
      action: '새로운 쓰레기 발견!',
    );
  });
}

class EntireMonthlyReward extends StatelessWidget {
  const EntireMonthlyReward({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor_black,
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
        ),
        backgroundColor: mainColor_black,
        foregroundColor: mainColor_white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "이번 달 포인트 기록",
                style: title1(color: mainColor_green),
              ),
              const SizedBox(height: 20),
              const Text(
                "날짜                          획득 포인트                         환경 실천",
                style: TextStyle(
                  color: mainColor_white,
                  fontSize: 10,
                  fontFamily: "gmarket",
                ),
              ),
              const SizedBox(height: 16),
              for (var item in data)
                Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          "${item.date}                  ${item.point}                                 ${item.action}",
                          style: const TextStyle(
                            color: gray_300,
                            fontSize: 10,
                            fontFamily: "gmarket",
                          ),
                        ),
                        const SizedBox(height: 14),
                      ],
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
