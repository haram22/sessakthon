import 'package:flutter/material.dart';
import 'package:pj1/View/home/initPopUp.dart';
import 'package:pj1/theme/colors.dart';

import '../../Model/collectionData.dart';
import '../../theme/textStyle.dart';
import '../home/homeView.dart';

class celebrationDialog extends StatefulWidget {
  const celebrationDialog({super.key});

  @override
  State<celebrationDialog> createState() => _celebrationDialogState();
}

class _celebrationDialogState extends State<celebrationDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 690,
      child: AlertDialog(
        backgroundColor: const Color(0xff242424),
        title: Center(
          child: Row(
            children: [
              GestureDetector(
                child: const Icon(Icons.close_rounded),
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(width: 55),
              Image.asset(
                "assets/splashLogo.png",
                width: 100,
                color: mainColor_green,
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.zero,
        content: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Image.asset(
                  "assets/celebration.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 55),
                Text(
                  "축하합니다!",
                  style: title1(),
                ),
                const SizedBox(height: 5),
                const Text(
                  "새로운 쓰레기를\n수집했어요!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'gmarket',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 250),
                const Text(
                  "페트병",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'gmarket',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: mainColor_green,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: mainColor_green),
                        color: const Color(0xFF242424),
                      ),
                      child: Text(
                        "플라스틱",
                        style: subtitle2(color: mainColor_green),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: mainColor_green),
                        color: const Color(0xFF242424),
                      ),
                      child: Text(
                        "비닐류a",
                        style: subtitle2(color: mainColor_green),
                      ),
                    ),
                  ],
                ),
                // ElevatedButton(
                //   onPressed: () => Navigator.pop(context),
                //   style: ElevatedButton.styleFrom(
                //       backgroundColor: mainColor_green),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         "확인",
                //         style: button(color: mainColor_black),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 150.0,
                top: 230,
              ),
              child: Transform.scale(
                scale: 1.2,
                child: Image.asset(
                  "assets/pet2.png",
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // setState(() {
                  //   isOpen = false;
                  // });
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => bottomNavi(
                  //             // selectedIndex: 0,
                  //             // selectedIndex: 1,
                  //             )));
                  // 여기여기여기에 init으로 추가해보기
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InitAlert()));
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: mainColor_green),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "확인",
                      style: button(color: mainColor_black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
