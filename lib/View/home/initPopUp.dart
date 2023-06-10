import 'package:flutter/material.dart';
import '../../Controller/liveLockScreen.dart';
import '../../theme/colors.dart';
import 'homeView.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class InitAlert extends StatefulWidget {
  const InitAlert({Key? key}) : super(key: key);

  @override
  State<InitAlert> createState() => _InitAlertState();
}

class _InitAlertState extends State<InitAlert> {

  String _liveWallpaper = 'Unknown';
  String liveUrl =
      'https://github.com/codenameakshay/sample-data/raw/main/video3.mp4';

  Future<void> setLiveWallpaper() async {
    setState(() {
      _liveWallpaper = 'Loading';
    });
    String result;
    var file = await DefaultCacheManager().getSingleFile(liveUrl);

    try {
      result = await AsyncWallpaper.setLiveWallpaper(
        filePath: file.path,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      )
          ? 'Wallpaper set'
          : 'Failed to get wallpaper.';
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }
    if (!mounted) return;

    setState(() {
      _liveWallpaper = result;
    });
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute(builder: (context) => bottomNavi()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      // width: double.infinity,
      // height: 330,  child: Column(
      children: [
        Center(
          child: Container(
            width: double.infinity,
            height: 340,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              titlePadding: EdgeInsets.only(left: 100, top: 30, ),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'pretendard',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              backgroundColor: Color(0xff242424),
              title: Text(
                "앱 접근 권한 안내",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'pretendard',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              content: Column(
                children: [
                  Container(
                    height: 123,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Color(0xff202020),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "원활한 서비스 이용을 위해서는",
                          style:
                              TextStyle(fontSize: 14, fontFamily: 'pretendard'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "라이브 잠금화면",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("설정을 위한",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'pretendard'))
                          ],
                        ),
                        Text("접근 권한이 필요합니다.",
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'pretendard')),
                        Text("허용하시겠습니까?",
                            style:
                                TextStyle(fontSize: 14, fontFamily: 'pretendard'))
                      ],
                    ),
                  )
                ],
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 46,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: gray_300,
                          ),
                          child: Text(
                            "거부",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'pretendard',
                                color: mainColor_black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        width: 120,
                        height: 46,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          onPressed: () {
                            setLiveWallpaper();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor_green,
                          ),
                          child:_liveWallpaper == 'Loading'
                      ? const CircularProgressIndicator()
                      : const Text(
                            "허용",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'pretendard',
                                color: mainColor_black,
                                fontWeight: FontWeight.bold),
                          ),
        
                           
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Positioned(
        //     top: -100,
        //     child: Image.network("https://i.imgur.com/2yaf2wb.png",
        //         width: 150, height: 150))
      ],
    );
  }
}


