import 'package:flutter/material.dart';
import 'package:pj1/theme/textStyle.dart';

import '../../theme/colors.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor_black,
      appBar: AppBar(
        title: const Text("분리수거 도감"),
        backgroundColor: mainColor_black,
        foregroundColor: mainColor_white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: mainColor_black,
                centerTitle: true,
                title: Text(
                  '밀어서 분리수거',
                  style: title1(color: mainColor_white),
                ),
                // 헤더의 높이나 다른 설정을 지정할 수 있습니다.
                // 필요에 따라 SliverAppBar을 조정하세요.
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // 그리드의 각 열에 표시될 항목 수를 설정합니다.
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    // 그리드 항목을 생성하는 로직을 작성합니다.
                    return GridTile(
                      child: Text('Item $index'),
                    );
                  },
                  childCount: 10,
                  // 그리드에 표시될 총 항목 수를 지정합니다.
                ),
              ),
            ],
          )),
    );
  }
}
