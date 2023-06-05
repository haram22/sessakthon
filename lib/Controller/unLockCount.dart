import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_state/screen_state.dart';

enum ScreenStateEvent { SCREEN_UNLOCKED, SCREEN_ON, SCREEN_OFF }

class UnLockCount extends StatefulWidget {
  @override
  _UnLockCountState createState() => _UnLockCountState();
}

class _UnLockCountState extends State<UnLockCount> {
  Screen _screen = Screen();
  int _screenOnCount = 0;
  int _screenOffCount = 0;

  @override
  void initState() {
    super.initState();
    _screen.screenStateStream?.listen((event) {
      setState(() {
        if (event == ScreenStateEvent.SCREEN_ON) {
          _screenOnCount++;
        } else if (event == ScreenStateEvent.SCREEN_OFF) {
          _screenOffCount++;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('UnLock Count'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Screen On: $_screenOnCount',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'Screen Off: $_screenOffCount',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Screen {
  EventChannel _eventChannel = const EventChannel('screenStateEvents');
  Stream<ScreenStateEvent>? _screenStateStream;

  Stream<ScreenStateEvent>? get screenStateStream {
    if (Platform.isAndroid) {
      if (_screenStateStream == null) {
        _screenStateStream = _eventChannel
            .receiveBroadcastStream()
            .map((event) => _parseScreenStateEvent(event));
      }
      return _screenStateStream;
    }
    throw ScreenStateException('Exception');
  }

  ScreenStateEvent _parseScreenStateEvent(String event) {
    switch (event) {
      case 'android.intent.action.SCREEN_OFF':
        return ScreenStateEvent.SCREEN_OFF;
      case 'android.intent.action.SCREEN_ON':
        return ScreenStateEvent.SCREEN_ON;
      case 'android.intent.action.USER_PRESENT':
        return ScreenStateEvent.SCREEN_UNLOCKED;
      default:
        throw ArgumentError('$event error');
    }
  }
}
