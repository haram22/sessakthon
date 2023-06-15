import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../View/home/homeView.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class InitAlert2 extends StatefulWidget {
  const InitAlert2({Key? key}) : super(key: key);

  @override
  State<InitAlert2> createState() => _InitAlert2State();
}

class _InitAlert2State extends State<InitAlert2> {
  String _liveWallpaper = 'Unknown';
  String liveUrl = 'https://github.com/eunoia-jason/data/raw/main/video2.mp4';

  Future<void> setLiveWallpaper() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => bottomNavi(),
      ),
    );

    setState(() {
      _liveWallpaper = 'Loading';
    });
    String result;
    var file = await DefaultCacheManager().getSingleFile(liveUrl);

    try {
      result = await AsyncWallpaper.setLiveWallpaper(
        filePath: file.path,
        goToHome: false,
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
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      // width: double.infinity,
      // height: 330,  child: Column(
      children: [
        Center(
          child: SizedBox(
            width: double.infinity,
            height: 340,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              titlePadding: const EdgeInsets.only(
                left: 100,
                top: 30,
              ),
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontFamily: 'pretendard',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              backgroundColor: const Color(0xff242424),
              title: const Text(
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
                        color: const Color(0xff202020),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Column(
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
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'pretendard'))
                      ],
                    ),
                  )
                ],
              ),
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10.0, left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 46,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: gray_300,
                          ),
                          child: const Text(
                            "거부",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'pretendard',
                                color: mainColor_black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
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
                          child: _liveWallpaper == 'Loading'
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
