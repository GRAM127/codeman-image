import 'package:photo_manager/photo_manager.dart';

abstract class ImageDataSource {

  Future<List<AssetPathEntity>> loadAlbums();
  Future<List<AssetEntity>> loadPhoto(AssetPathEntity path);

  Future<String> getImageData(AssetEntity image);
}