abstract class ImageDataSource {

  Future<List<AssetPathEntity>> loadAlbums();

  String getImageData();
}