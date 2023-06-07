import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pj1/theme/colors.dart';
import 'package:screen_state/screen_state.dart';

import 'Controller/unLockCount.dart';
import 'View/home/homeView.dart';

// splash
enum ScreenStateEvent { SCREEN_UNLOCKED, SCREEN_ON, SCREEN_OFF }

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//       .then((_) {
//     runApp(UnLockCount());
//   });
// }
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bottomNavi(),
    );
  }

}
