import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/landing/home/data/data_source/home_data_source.dart';
import 'package:e_commerce/feature/landing/home/data/models/home_menus_model.dart';
import 'package:e_commerce/feature/landing/home/domain/repositories/home_repository.dart';

import '../../../../../core/error/failure.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});
  @override
  Future<Either<Failure, List<String>>> getCarouselImages() async {
    final response = await homeDataSource.getCarouselImages();
    return Right(response);
  }

  @override
  Future<Either<Failure, List<HomeMenusModel>>> getHomeMenuModel() async {
    final response = await homeDataSource.getHomeMenuModel();
    return Right(response);
  }
}
