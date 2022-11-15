import 'package:photo_manager/photo_manager.dart';

import 'ImageDataSource.dart';

class ImageDataSourceImpl extends ImageDataSource {

  @override
  Future<List<AssetPathEntity>> loadAlbums() async {
    return await PhotoManager.getAssetPathList();
  }

  @override
  String getImageData() {

  }

}