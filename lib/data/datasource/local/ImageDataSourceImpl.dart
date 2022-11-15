import 'package:photo_manager/photo_manager.dart';

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
  String getImageData() {

  }

}