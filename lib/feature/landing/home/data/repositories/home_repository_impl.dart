import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/landing/home/data/data_source/home_data_source.dart';
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
}
