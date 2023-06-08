import 'package:flutter/material.dart';
import 'package:pj1/View/challenge/challengeComp.dart';
import 'package:pj1/theme/textStyle.dart';
import 'package:pj1/Model/challengeData.dart';

import '../../theme/colors.dart';

class challengeView extends StatefulWidget {
  const challengeView({super.key});

  @override
  State<challengeView> createState() => _challengeViewState();
}

class _challengeViewState extends State<challengeView> {
  int _selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor_black,
      appBar: AppBar(
        title: Text(
          "챌린지",
          style: landingTitle(color: mainColor_white),
        ),
        backgroundColor: mainColor_black,
        foregroundColor: mainColor_white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBoxTextButton("둘러보기", 0),
                _buildBoxTextButton("참여중", 1),
                _buildBoxTextButton("참여 완료", 2),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ChallengeComp()]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoxTextButton(String text, int index) {
    final bool isSelected = _selectedButtonIndex == index;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? Colors.white : Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedButtonIndex = index;
          });
        },
        child: Center(
          child: Container(
            width: 80,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
