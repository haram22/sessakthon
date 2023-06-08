import 'package:flutter/material.dart';
import 'package:pj1/Model/challengeData.dart';

import '../../theme/colors.dart';
import '../../theme/textStyle.dart';
import 'challengeDetail.dart';

class ChallengeComp extends StatefulWidget {
  @override
  _ChallengeCompState createState() => _ChallengeCompState();
}

class _ChallengeCompState extends State<ChallengeComp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          mainAxisExtent: 230,
        ),
        itemBuilder: (_, index) {
          final map = challengeData[index];
          return InkWell(
            onTap: () {
              _challengeDetailPage(context, challengeData[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: mainColor_black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (map.containsKey('image'))
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                        bottomLeft: Radius.circular(16.0),
                      ),
                      child: Image.asset(
                        map['image'],
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  SizedBox(
                    height: 8,
                  ),
                  if (map.containsKey('organization'))
                    Text(map['organization'],
                        style: subtitle2(color: mainColor_white)),
                  if (map.containsKey('title'))
                    Text(map['title'],
                        style: TextStyle(
                            height: 1.2,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: 'gmarket')),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      if (map.containsKey('length'))
                        Row(
                          children: [
                            Container(
                              width: 44,
                              height: 16,
                              decoration: BoxDecoration(
                                  color: Color(0xffBDBDBD),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    map['length'],
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
                            SizedBox(width: 7)
                          ],
                        ),
                      if (map.containsKey('desription'))
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: Text(
                            map['desription'],
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
              ),
            ),
          );
        },
        itemCount: challengeData.length,
      ),
    );
  }

  void _challengeDetailPage(
      BuildContext context, Map<String, dynamic> challengeInfo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => challengeDetail(challengeInfo: challengeInfo),
      ),
    );
  }
}
