import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_gif/flutter_gif.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 21, 6, 47)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Image image = Image(image: AssetImage('assets/rocket.gif'));
    fetchGif(AssetImage("assets/rocket.gif"));

    return Scaffold(
      appBar: AppBar(
        title: const Text("set Image"),
      ),
      body: Column(
        children: [
          image,
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          int location = WallpaperManager.BOTH_SCREEN;
          await setWallpaperFromAsset('assets/rocket.gif', location);
        },
        label: const Text("Set 🌱"),
      ),
    );
  }

  Future<void> setWallpaperFromAsset(String assetPath, int location) async {
    String fileName = assetPath.split('/').last;
    String filePath = (await getTemporaryDirectory()).path + '/$fileName';

    ByteData assetData = await rootBundle.load(assetPath);
    List<int> bytes = assetData.buffer.asUint8List();
    await File(filePath).writeAsBytes(bytes);

    await WallpaperManager.setWallpaperFromFile(filePath, location);
  }
}
