import 'package:flutter/material.dart';
import 'package:pj1/View/challenge/challengeComp.dart';
import 'package:pj1/theme/textStyle.dart';

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
        title: const Text("챌린지"),
        backgroundColor: mainColor_black,
        foregroundColor: mainColor_white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBoxTextButton("전체", 0),
                _buildBoxTextButton("참여중", 1),
                _buildBoxTextButton("참여 완료", 2),  
              ],
            ),
          ),
          SizedBox(height: 40,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card()
                ]
              ),
            ),
          ),
        ],
      ), 
    );
  }
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "지구를 위한 우리의 용기",
      "image": 'assets/challenge/challengeComp1.png',
      "organization" : "햇반X오지지",
      "desription" : "오늘부터 시작",
      "length" : "2주동안"
    },
    {
      "title": "Hi2",
      "image": 'assets/challenge/challengeComp1.png',
      "organization" : "",
      "desription" : "",
      "length" : ""
    },
    {
      "title": "H3i",
      "image": 'assets/challenge/challengeComp1.png',
      "organization" : "",
      "desription" : "",
      "length" : ""
    },
    {
      "title": "Hi",
      "image": 'assets/challenge/challengeComp1.png',
      "organization" : "",
      "desription" : "",
      "length" : ""
    },
    {
      "title": "Hi",
      "image": 'assets/challenge/challengeComp1.png',
      "organization" : "",
      "desription" : "",
      "length" : ""
    },
    {
      "title": "Hi",
      "image": 'assets/challenge/challengeComp1.png',
      "organization" : "",
      "desription" : "",
      "length" : ""
    },
    {
      "title": "Hi",
      "image": 'assets/challenge/challengeComp1.png',
      "organization" : "",
      "desription" : "",
      "length" : ""
    },
  ];
  Widget Card(){
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
          final map = gridMap[index];
          return Container(
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
                      width:double.infinity,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8,),
                if (map.containsKey('organization'))
                  Text(
                    map['organization'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: mainColor_white,
                    ),
                  ),
                if (map.containsKey('title'))
                  Text(
                    map['title'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Row(
                  children: [
                    if (map.containsKey('length'))
                      Text(
                        map['length'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    if (map.containsKey('description'))
                      Text(
                        map['description'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: gridMap.length,
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
