import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Controller/unLockCount.dart';

enum ScreenStateEvent { SCREEN_UNLOCKED, SCREEN_ON, SCREEN_OFF }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(UnLockCount());
  });
}
