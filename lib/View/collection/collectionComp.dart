import 'package:flutter/material.dart';
import 'package:pj1/theme/textStyle.dart';
import 'package:video_player/video_player.dart';

import '../../Model/collectionData.dart';
import '../../theme/colors.dart';
import 'collectionDetail.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

bool isDialogShown = false;

class _CollectionPageState extends State<CollectionPage> {
  late VideoPlayerController _controller;
  // Flag to track if the dialog has been shown

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://github.com/eunoia-jason/data/raw/main/hetbahn.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();

    if (!isDialogShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showCelebrationDialog(context, collection[0]);
        setState(() {
          isDialogShown = true;
        });
      });
    } else {
      print("Dialog already shown");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void showCelebrationDialog(BuildContext context, CollectionItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 500,
          child: AlertDialog(
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
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/celebration.png",
                      fit: BoxFit.cover,
                    ),
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
                    const Center(
                      child: Text(
                        "페트병",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'gmarket',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: mainColor_green,
                        ),
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
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        isDialogShown = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor_green),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: mainColor_black,
          appBar: AppBar(
            title: const Text("분리배출 도감"),
            backgroundColor: mainColor_black,
            foregroundColor: mainColor_white,
            elevation: 0,
            centerTitle: true,
            leading: const SizedBox.shrink(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  leading: const SizedBox.shrink(),
                  backgroundColor: mainColor_black,
                  expandedHeight: 200,
                  centerTitle: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 75),
                            Text(
                              '밀어서 분리배출',
                              style: title1(color: mainColor_green),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "랜덤으로 나오는 분리배출 아이템을\n도감에 모아보세요!",
                              style: TextStyle(
                                fontFamily: 'gmarket',
                                fontSize: 13,
                                height: 1.3,
                                fontWeight: FontWeight.w100,
                                color: mainColor_green,
                              ),
                            ),
                          ],
                        ),
                        Image.asset("assets/pet.png"),
                      ],
                    ),
                  ),
                  // 헤더의 높이나 다른 설정을 지정할 수 있습니다.
                  // 필요에 따라 SliverAppBar을 조정하세요.
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 24,
                    // 그리드의 각 열에 표시될 항목 수를 설정합니다.
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      // 그리드 항목을 생성하는 로직을 작성합니다.
                      return GestureDetector(
                        onTap: () => showAlertDialog(
                            context, collection[index], _controller),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 95,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: collection[index].color,
                                ),
                                child: Image.asset(collection[index].image),
                              ),
                            ),
                            const SizedBox(height: 8),
                            collection[index].name == "???"
                                ? Image.asset(
                                    "assets/lock.png",
                                    color: gray_300,
                                    width: 8,
                                  )
                                : Text(
                                    collection[index].name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'gmarket',
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: gray_300,
                                    ),
                                  ),
                          ],
                        ),
                      );
                    },
                    childCount: collection.length,
                    // 그리드에 표시될 총 항목 수를 지정합니다.
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
