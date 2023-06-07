import 'package:flutter/material.dart';

class challengeComp extends StatefulWidget {
  const challengeComp({super.key});

  @override
  State<challengeComp> createState() => _challengeCompState();
}

class _challengeCompState extends State<challengeComp> {
  final List<Map<String,dynamic>> gridMap = [
    {
      "title" : "Hi",
      "image" : AssetImage('assets/challenge/challengeComp1.png'),
    },
    {
      "title" : "H2i"
    },
    {
      "title" : "H3i",
    },
    {
      "title" : "H4i",
    },
    {
      "title" : "H5i",
    },
    {
      "title" : "H5i",
    },
    {
      "title" : "H5i",
    },
    {
      "title" : "H5i",
    },
    {
      "title" : "H5i",
    },

  ];

  Widget build(BuildContext context){
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          mainAxisExtent: 190,
          ), 
        itemBuilder: (_,index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Color.fromARGB(255, 205, 174, 171)
            ),
            child: Column(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft:  Radius.circular(16.0), topRight: Radius.circular(16.0)),
                child: Image.network(
                  "${gridMap.elementAt(index)['images']}",
                  height: 60,
                  fit: BoxFit.cover,
                ),
              )
            ]),
          );
        }, 
        itemCount: gridMap.length, 
      );
  }
}