import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/textStyle.dart';

class challengeDetail extends StatelessWidget {
  final Map<String, dynamic> challengeInfo;
  const challengeDetail({Key? key, required this.challengeInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor_black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset('assets/challengeDetail/backImg.png'),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                )
              ],
            ),
            SizedBox(height: 34),
            Padding(
              padding: const EdgeInsets.only(left: 27.0),
              child: infoData(),
            ),
            SizedBox(height: 32),
            Image.asset('assets/challengeDetail/grayLine.png',
                width: double.infinity, fit: BoxFit.fill),
            reviewData()
          ],
        ),
      ),
    );
  }

  Widget infoData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 87,
            height: 29,
            decoration: BoxDecoration(
                border: Border.all(color: mainColor_green, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(31))),
            child: Center(
              child: Text(
                challengeInfo['kindofTrash'],
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'pretendart',
                    fontWeight: FontWeight.normal,
                    color: mainColor_green),
              ),
            )),
        SizedBox(height: 12),
        Text(
          challengeInfo['title'],
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'gmarket',
              color: mainColor_green),
        ),
        SizedBox(height: 15),
        Text(
          challengeInfo['participants'] + "명 참여중",
          style: TextStyle(
              fontFamily: 'gmarket',
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: mainColor_green),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Container(
              width: 44,
              height: 16,
              decoration: BoxDecoration(
                  color: Color(0xffBDBDBD),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Text(
                    challengeInfo['length'],
                    style: TextStyle(
                      color: mainColor_black,
                      fontSize: 10,
                      fontFamily: 'pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 7),
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Text(
                challengeInfo['desription'],
                style: TextStyle(
                  fontFamily: 'pretendard',
                  color: mainColor_white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget reviewData() {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 27, left: 32.0, right: 30, bottom: 12),
          child: Row(
            children: [
              Text(
                "참가자 후기",
                style: title1(color: mainColor_green),
              ),
              Spacer(),
              Text(
                "누적 참가자" + challengeInfo['totalParticipants'],
                style: TextStyle(
                    color: Color(0xffB1B1B1),
                    fontFamily: 'gmarket',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 30, bottom: 22),
          child: Row(
            children: [
              Image.asset('assets/challengeDetail/star.png'),
              SizedBox(width: 7),
              Text(
                challengeInfo['starRate'],
                style: TextStyle(
                    fontFamily: 'gmarket',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 30),
              _reviewCard(0),
              SizedBox(width: 8),
              _reviewCard(1),
              SizedBox(width: 8),
              _reviewCard(0),
            ],
          ),
        ),
        SizedBox(height: 21),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          width: 330,
          height: 53,
          child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(gray_300),
              ),
              onPressed: () {},
              child: Text(
                challengeInfo['reviewNum'] + "개 후기 모두 보기",
                style: TextStyle(
                    color: Color(0xff080808),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: 'gmarket'),
              )),
        ),
        SizedBox(height: 33),
      ],
    );
  }

  Widget _reviewCard(int index) {
    return Container(
      width: 188,
      height: 117,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Color(0xff2B2B2B), width: 2)),
      child: Padding(
        padding: EdgeInsets.only(left: 11.0, right: 7),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 13.0,
                bottom: 21,
              ),
              child: Row(
                children: [
                  Text(challengeInfo['userReview'][index]['starRate']),
                  Spacer()
                ],
              ),
            ),
            Text(
              challengeInfo['userReview'][index]['comment'],
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'pretendart',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: gray_300),
            )
          ],
        ),
      ),
    );
  }
}
