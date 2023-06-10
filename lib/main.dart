import 'dart:async';

import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pj1/View/home/homeView.dart';
import 'package:pj1/theme/colors.dart';
import 'package:screen_state/screen_state.dart';
import 'package:flutter/services.dart';

import 'Controller/unLockCount.dart';
import 'View/home/homeView.dart';
import 'View/home/initPopUp.dart';

enum ScreenStateEvent { SCREEN_UNLOCKED, SCREEN_ON, SCREEN_OFF }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenGame(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Come again'),
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute(builder: (context) => SplashScreenGame()),
            );
          },
        ),
      ),
    );
  }
}

class SplashScreenGame extends StatefulWidget {
  @override
  _SplashScreenGameState createState() => _SplashScreenGameState();
}

class _SplashScreenGameState extends State<SplashScreenGame> {
  late FlameSplashController controller;
  bool showInitDialog = false;

  void showInitAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return InitAlert();
      },
    );
  }

  void initState() {
    super.initState();
    // Start a timer to simulate the splash screen duration
    Timer(Duration(seconds: 3), () {
      setState(() {
        showInitDialog = true;
      });
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlameSplashScreen(
            theme: FlameSplashTheme(
              backgroundDecoration: BoxDecoration(
                color: showInitDialog ? mainColor_black : mainColor_green,
              ),
              logoBuilder: (BuildContext context) {
                return Image.asset('assets/splashLogo.png', width: 128);
              },
            ),
            onFinish: (context) {
              setState(() {
                showInitDialog = true;
              });
              // Optionally, you can call your own method here to change the background color
              // after the splash screen finishes.
              // changeBackgroundColor();
            },
          ),
          if (showInitDialog) InitAlert(),
        ],
      ),
    );
  }
}
