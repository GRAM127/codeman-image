import 'package:photo_manager/photo_manager.dart';

abstract class ImageRepository {

  Future<List<AssetEntity>> loadPhoto();

  Future<String> getImageData();
}