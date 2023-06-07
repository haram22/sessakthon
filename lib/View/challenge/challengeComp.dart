import 'package:flutter/material.dart';

class ChallengeComp extends StatelessWidget {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Hi",
      "image": 'assets/challenge/challengeComp1.png',
    },
    {
      "title": "H2i",
    },
    {
      "title": "H3i",
    },
    {
      "title": "H4i",
    },
    {
      "title": "H5i",
    },
    {
      "title": "H5i",
    },
    {
      "title": "H5i",
    },
    {
      "title": "H5i",
    },
    {
      "title": "H5i",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 190,
      ),
      itemBuilder: (_, index) {
        final map = gridMap[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Color.fromARGB(255, 205, 174, 171),
          ),
          child: Column(
            children: [
              if (map.containsKey('image'))
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.asset(
                    map['image'],
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              if (map.containsKey('title'))
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    map['title'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
      itemCount: gridMap.length,
    );
  }
}
