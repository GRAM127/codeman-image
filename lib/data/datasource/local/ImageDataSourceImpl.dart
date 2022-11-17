import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ImageDataSource.dart';
import 'package:exif/exif.dart';

class ImageDataSourceImpl extends ImageDataSource {
  @override
  Future<String> getImageData() async {
    // final fileBytes = File("assets/20220919_185450.jpg").readAsBytesSync();
    final fileBytes = (await rootBundle.load("assets/20220919_185450.jpg")).buffer.asUint8List();
    final data = await readExifFromBytes(fileBytes);

    if (data.isEmpty) {
      print("#LOG : No EXIF information found");
      return "";
    }

    if (data.containsKey('JPEGThumbnail')) {
      print('#LOG : File has JPEG thumbnail');
      data.remove('JPEGThumbnail');
    }
    if (data.containsKey('TIFFThumbnail')) {
      print('#LOG : File has TIFF thumbnail');
      data.remove('TIFFThumbnail');
    }

    for (final entry in data.entries) {
      print("${entry.key}: ${entry.value}");
    }
    return "";
  }
}
