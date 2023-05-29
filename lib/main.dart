import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var imageUrl =
      "https://mblogthumb-phinf.pstatic.net/MjAxNzEyMTNfMTcx/MDAxNTEzMTQ4OTc3OTQx.8ZWyFPYKvp48d-qHLL4qBMAIO6RKp60XYJjtYnr9HSkg.yKxlMfuNsxyQ5ApWgmuunyPNfK7z5sGQaOYAek-ZXygg.JPEG.mypetparty/adam-krowitz-386792.jpg?type=w800";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("set Image"),
      ),
      body: Column(children: [
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: 500,
        )
      ]),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            int location =
                WallpaperManager.LOCK_SCREEN; //can be Home/Lock Screen
            var file = await DefaultCacheManager().getSingleFile(imageUrl);
            bool result = await WallpaperManager.setWallpaperFromFile(
                file.path, location);
          },
          label: Text("Set 🌱")),
    );
  }
}
