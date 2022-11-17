
import 'package:codeman/domain/repository/ImageRepository.dart';

import '../datasource/local/ImageDataSource.dart';
import '../datasource/local/ImageDataSourceImpl.dart';

class ImageRepositoryImpl extends ImageRepository {

  final ImageDataSource imageDataSource = ImageDataSourceImpl();

  @override
  Future<String> getImageData() async {
    return await imageDataSource.getImageData();
  }
}