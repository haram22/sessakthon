import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: setLiveWallpaper,
                child: _liveWallpaper == 'Loading'
                    ? const CircularProgressIndicator()
                    : const Text('Set live wallpaper'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
