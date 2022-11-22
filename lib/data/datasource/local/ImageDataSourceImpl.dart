import 'package:photo_manager/photo_manager.dart';
import 'package:exif/exif.dart';

import 'ImageDataSource.dart';

class ImageDataSourceImpl extends ImageDataSource {

  @override
  Future<List<AssetPathEntity>> loadAlbums() async {
    return await PhotoManager.getAssetPathList();
  }

  @override
  Future<List<AssetEntity>> loadPhoto(AssetPathEntity path) async {
    return await path.getAssetListPaged(page: 0, size: 20); // TODO
  }

  @override
  Future<String> getImageData(AssetEntity image) async {
    final fileBytes = (await image.file)!.readAsBytesSync();
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