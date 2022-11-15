import 'package:flutter/material.dart';

import 'package:codeman/presentation/home.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  Future<bool> _checkPermission() async {
    // final permissionState = await PhotoManager.requestPermissionExtend();
    await [Permission.storage, Permission.camera].request(); // TODO: camera 권한 필요 없을 가능성
    return Future(() async => await Permission.camera.isGranted && await Permission.camera.isGranted);
  }
  // TODO: https://dalgoodori.tistory.com/37
  // TODO: https://velog.io/@dal-pi/Flutter-Shuffle-Gallery-%EC%95%B1-%EA%B0%9C%EB%B0%9C-%EB%A1%9C%EA%B7%B8

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkPermission(),
      builder: (context, AsyncSnapshot snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) { }
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}