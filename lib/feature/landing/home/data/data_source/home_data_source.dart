abstract class HomeDataSource {
  Future<List<String>> getCarouselImages();
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<List<String>> getCarouselImages() {
    List<String> list = List.empty();
    for (int i = 0; i < 10; i++) {
      list.add('https://picsum.photos/250?image=$i');
    }
    return Future.value(list);
  }
}
