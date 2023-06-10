import 'package:flutter/material.dart';
import 'package:pj1/theme/colors.dart';

import '../../Model/collectionData.dart';
import '../../theme/textStyle.dart';

void showCelebrationDialog(BuildContext context, CollectionItem item) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xff242424),
        title: Row(
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
        contentPadding: EdgeInsets.zero,
        content: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/celebration.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 50),
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
                const SizedBox(height: 300),
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
                        "비닐류",
                        style: subtitle2(color: mainColor_green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 100.0,
                top: 200,
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
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: mainColor_green),
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
        ],
      );
    },
  );
}
