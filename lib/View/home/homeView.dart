import 'package:flutter/material.dart';
import 'package:pj1/View/collection/collectionComp.dart';
import 'package:pj1/View/reward/dashBoard.dart';
import 'package:pj1/theme/colors.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';

class bottomNavi extends StatefulWidget {
  const bottomNavi({super.key});
  @override
  State<bottomNavi> createState() => _bottomNaviState();
}

class _bottomNaviState extends State<bottomNavi> {
  int _selectedIndex = 0;
  late List<bool> ispress;
  bool ispress1 = true;
  bool ispress2 = true;
  bool ispress3 = true;
  bool ispress4 = true;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    CollectionPage(),
    HomeView(),
    DashBoardPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 0.2)),
        child: BottomNavigationBar(
            backgroundColor: const Color(0xff242424),
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: const Color(0xff747474),
            elevation: 5,
            currentIndex: _selectedIndex,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            iconSize: 28,
            items: const [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 3.0, top: 10),
                    child: ImageIcon(AssetImage('assets/bottomIcon/Home.png')),
                  ),
                  label: '홈'),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 30,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 3.0, top: 10),
                        child: ImageIcon(
                            AssetImage('assets/bottomIcon/unCollection.png'))),
                  ),
                  label: '도감'),
              BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 40,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 3.0, top: 10),
                      child: ImageIcon(
                          AssetImage('assets/bottomIcon/challenge.png')),
                    ),
                  ),
                  label: '챌린지'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 3.0, top: 10),
                    child:
                        ImageIcon(AssetImage('assets/bottomIcon/reward.png')),
                  ),
                  label: '환전소'),
            ],
            selectedItemColor: Colors.white),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor_black,
      body: Column(children: [
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 58),
              child: Image.asset(
                'assets/logo.png',
                width: 66,
              ),
            ),
          ],
        ),
        const SizedBox(height: 42),
        TextSection(),
        const SizedBox(height: 40),
        CircleProgress(),
        const SizedBox(height: 45),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 22),
          child: _HomeCollection(),
        )
      ]),
    );
  }

  Widget TextSection() {
    return const Column(
      children: [
        Text(
          "밀어서 분리배출",
          style: TextStyle(
              height: 1.55,
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'pretendart',
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "분리수거 잠금화면을 해제하고 포인트를 받아보세요.\n잠금해제 1번 당 1포인트를 드려요.",
          textAlign: TextAlign.center,
          style: TextStyle(
              height: 1.55,
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'gmarket'),
        )
      ],
    );
  }

  Widget CircleProgress() {
    return Stack(
      children: [
        SizedBox(
          width: 232,
          child: CircleProgressBar(
            strokeWidth: 14,
            foregroundColor: mainColor_green,
            backgroundColor: const Color(0xff1E1E1E),
            value: -0.7,
            child: _contentsCircle(),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Image.asset(
              'assets/homeTooltip.png',
              width: 120,
            ))
      ],
    );
  }

  Widget _contentsCircle() {
    const innerMargin = 0;
    const double strokeWidth = 0;
    const Color backgroundColor = Color(0xff2B2B2B);

    final innerLayout = Container(
      margin: const EdgeInsets.all(innerMargin + strokeWidth),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(150),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            '오늘의 포인트',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'pretendard',
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          const Text(
            "150P",
            style: TextStyle(
                color: mainColor_green,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'gmarket'),
          ),
          const SizedBox(height: 19),
          SizedBox(
            height: 24,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // 모서리 반경 설정
                ),
                side: const BorderSide(color: Color(0xff545454)), // 아웃라인 색상 설정
              ),
              onPressed: () {},
              child: const Text(
                "더보기  >",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xffBFBEBE),
                    fontSize: 10,
                    fontFamily: 'pretendard'),
              ),
            ),
          )
        ],
      ),
    );
    return innerLayout;
  }

  Widget _HomeCollection() {
    return Container(
      child: Column(children: [
        Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "분리수거 도감",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'gmarket',
                      color: mainColor_green),
                ),
                SizedBox(height: 8),
                Text(
                  "지금까지 모은 도감 더 보러가기",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'gmarket',
                      color: Colors.white),
                )
              ],
            ),
            const Spacer(),
            OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "전체보기 >",
                  style: TextStyle(
                      color: mainColor_green,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'gmarket'),
                ))
          ],
        ),
        Row(
          children: [
            _collectionPreview('햇반용기', 'assets/collection/collection1.png'),
            const SizedBox(width: 25),
            _collectionPreview('햇반용기', 'assets/collection/collection2.png'),
            const SizedBox(width: 25),
            _collectionPreview('햇반용기', 'assets/collection/collection3.png')
          ],
        )
        // Row(
        //   children: [
        //     Column(
        //       children: [
        //         Image.asset('assets/collection/collection1.png'),
        //         Text(collection_label)
        //       ],
        //     ),
        //     Image.asset('assets/collection/collection2.png'),
        //     Image.asset('assets/collection/collection3.png')
        //   ],
        // )
      ]),
    );
  }

  Widget _collectionPreview(String collectionLabel, String imagePath) {
    return Column(
      children: [
        const SizedBox(height: 17),
        Image.asset(imagePath),
        const SizedBox(height: 8),
        Text(
          collectionLabel,
          style: const TextStyle(
              color: Color(0xffB1B1B1),
              fontFamily: 'gmarket',
              fontSize: 12,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
