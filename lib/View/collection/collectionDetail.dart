import 'package:flutter/material.dart';
import 'package:pj1/theme/colors.dart';
import 'package:pj1/theme/textStyle.dart';
import 'collectionComp.dart';

void showAlertDialog(BuildContext context, CollectionItem item) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xff242424),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: const Icon(Icons.close_rounded),
              onTap: () => Navigator.pop(context),
            ),
            Text(
              item.tier,
              style: title2(color: item.color),
            ),
            const SizedBox.shrink(),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                item.image,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 50),
              Text(
                item.name,
                style: title1(),
              ),
              const SizedBox(height: 5),
              const Text(
                "#즉석밥 #오뚜기밥",
                style: TextStyle(
                  fontFamily: 'gmarket',
                  fontWeight: FontWeight.w100,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 60),
              const Row(
                children: [
                  Text(
                    "분리배출 방법",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'gmarket',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: mainColor_green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "- 빈 용기는 밥알이 남아있지 않게 깨끗이 세척한 후\n   플라스틱으로 배출해요.\n- 비닐 뚜껑은 떼어내서 비닐류로 배출해요.",
                style: subtitle1(),
              ),
              const SizedBox(height: 20),
              item.isCollected
                  ? Column(
                      children: [
                        const Row(
                          children: [
                            Text(
                              "알아두면 좋은 점",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'gmarket',
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: mainColor_green,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "즉석밥 용기에 쓰이는 플라스틱 OTHER는\n내열성을 높이기 위해 여러 재질을 혼합한 복합\n플라스틱으로 제품 종류별로 수거해 별도의\n재활용 공정을 거치지 않는 이상 재활용이 불가능해요.\n그래서 재활용장에서 선별되지 못하고 대부분\n일반쓰레기로 폐기(소각 또는 매립)된다고 합니다.",
                          style: subtitle1(),
                        ),
                      ],
                    )
                  : const SizedBox(height: 115),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: item.isCollected ? () {} : null,
            style: ElevatedButton.styleFrom(backgroundColor: mainColor_green),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "친구에게 공유하고 리워드 받기",
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
