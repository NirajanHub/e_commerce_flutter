import 'package:e_commerce/feature/landing/home/data/models/home_menus_model.dart';

abstract class HomeDataSource {
  Future<List<String>> getCarouselImages();
  Future<List<HomeMenusModel>> getHomeMenuModel();
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<List<String>> getCarouselImages() {
    List<String> list = List.empty(growable: true);
    for (int i = 1; i < 9; i++) {
      list.add('https://picsum.photos/250?image=$i');
    }
    return Future.value(list);
  }

  @override
  Future<List<HomeMenusModel>> getHomeMenuModel() {
    List<HomeMenusModel> list = List.empty(growable: true);
    for (int i = 1; i < 9; i++) {
      HomeMenusModel homeMenusModel =
          HomeMenusModel('$i', 'https://picsum.photos/250?image=$i');
      list.add(homeMenusModel);
    }
    return Future.value(list);
  }
}
