import 'package:codeman/domain/repository/ImageRepository.dart';
import 'package:photo_manager/photo_manager.dart';

import '../datasource/local/ImageDataSource.dart';
import '../datasource/local/ImageDataSourceImpl.dart';

class ImageRepositoryImpl extends ImageRepository {

  final ImageDataSource imageDataSource = ImageDataSourceImpl();

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
  Future<String> getImageData(AssetEntity image) async {
    return await imageDataSource.getImageData(image);
  }


  ImageRepositoryImpl._privateConstructor();
  static final ImageRepositoryImpl _instance = ImageRepositoryImpl._privateConstructor();
  factory ImageRepositoryImpl() => _instance;
}