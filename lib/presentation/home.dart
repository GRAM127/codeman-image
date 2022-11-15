import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import '../data/repository/ImageRepositoryImpl.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final ImageRepositoryImpl imageRepository = ImageRepositoryImpl();

  List<AssetEntity>? images;

  void _loadImage() async {
    final i = await imageRepository.loadPhoto();
    setState(() {
      images = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: images != null ? images!.map((AssetEntity e) =>
              AssetEntityImage(
                e,
                isOriginal: false,
                fit: BoxFit.cover,
              )
          ).toList() : <AssetEntityImage>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadImage,
        tooltip: 'Image',
        child: Icon(Icons.image),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}