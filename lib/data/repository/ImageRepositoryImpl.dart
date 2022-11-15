import 'package:codeman/domain/repository/ImageRepository.dart';
import 'package:photo_manager/photo_manager.dart';

import '../datasource/local/ImageDataSourceImpl.dart';

class ImageRepositoryImpl extends ImageRepository {

  final ImageDataSourceImpl imageDataSource = ImageDataSourceImpl();

  @override
  Future<List<AssetEntity>> loadPhoto() async {
    final albums = await imageDataSource.loadAlbums();

    for (AssetPathEntity path in albums) {
      if (path.isAll) {
        return imageDataSource.loadPhoto(path);
      }
    }
    throw Error();
  }

  @override
  String getImageData() {

  }
}