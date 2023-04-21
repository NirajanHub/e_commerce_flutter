import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/landing/home/data/models/carousel_images_model.dart';
import 'package:e_commerce/feature/landing/home/data/models/home_data_model.dart';
import 'package:e_commerce/feature/landing/home/data/models/home_menus_model.dart';
import 'package:e_commerce/feature/landing/home/domain/entities/home_data.dart';
import 'package:e_commerce/feature/landing/home/domain/use_cases/get_carousel_image_use_case.dart';
import 'package:e_commerce/feature/landing/home/domain/use_cases/get_home_menu_model_use_case.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repositories/home_repository.dart';

class GetHomePageLoadedUseCase extends UseCase<HomeDataEntity, void> {
  final HomeRepository homeRepository;

  GetHomePageLoadedUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, HomeDataEntity>>? call(void params) async {
    final carouselImages = await
        // ignore: void_checks
        GetCarouselImagesUseCase(homeRepository: homeRepository).call(Object());
    late CarouselImagesModel carouselImageLoaded;
    late List<HomeMenusModel> homeMenuModel;

    final homeIconData =
        await GetHomeMenuModelUseCase(homeRepository: homeRepository)
            // ignore: void_checks
            .call(Object());
    homeIconData?.fold((l) => {}, (r) => {homeMenuModel = r});
    // ignore: void_checks
    GetHomeMenuModelUseCase(homeRepository: homeRepository).call(Object());
    carouselImages.fold((l) => {},
        (r) => {carouselImageLoaded = CarouselImagesModel(images: r)});

    final homeDataModel = HomeDataModel(
        carouselImagesModel: carouselImageLoaded,
        homeMenusModel: homeMenuModel);
    return Right(homeDataModel);
  }
}
