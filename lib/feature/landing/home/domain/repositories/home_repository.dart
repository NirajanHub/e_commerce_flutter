import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/landing/home/data/models/home_menus_model.dart';

import '../../../../../core/error/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<String>>> getCarouselImages();
  Future<Either<Failure, List<HomeMenusModel>>> getHomeMenuModel();
}
