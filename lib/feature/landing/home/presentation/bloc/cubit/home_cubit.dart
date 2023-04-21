import 'package:e_commerce/feature/landing/home/data/models/home_menus_model.dart';
import 'package:e_commerce/feature/landing/home/domain/use_cases/get_home_page_data_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/feature/landing/home/domain/use_cases/get_carousel_image_use_case.dart';

import '../../../domain/use_cases/get_home_menu_model_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCarouselImagesUseCase getCarouselUseCase;
  final GetHomeMenuModelUseCase getHomeMenuModelUseCase;
  final GetHomePageLoadedUseCase getHomePageLoadedUseCase;
  HomeCubit(
      {required this.getHomePageLoadedUseCase,
      required this.getCarouselUseCase,
      required this.getHomeMenuModelUseCase})
      : super(HomeInitial());

  void loadInitialData() async {
    await getHomePageData();
  }

  Future<void> getCarouselImages() async {
    try {
      final images = await getCarouselUseCase(Object());
      images.fold(
          (failure) =>
              {emit(LoadingState()), emit(const ErrorState(message: 'Error'))},
          (success) => {
                emit(LoadingState()),
                emit(CarouselImagesLoaded(carouselImages: success)),
              });
    } catch (e) {
      emit(const ErrorState(message: 'ServerException'));
    }
  }

  Future<void> getHomeMenuModel() async {
    try {
      final homeMenuModel = await getHomeMenuModelUseCase(Object());
      homeMenuModel!.fold(
          (failure) => {
                emit(LoadingState()),
                emit(ErrorState(message: failure.toString()))
              },
          (success) => {
                emit(LoadingState()),
                emit(HomeMenuLoaded(homeMenuModel: success))
              });
    } catch (e) {
      emit(const ErrorState(message: 'ServerException'));
    }
  }

  Future<void> getHomePageData() async {
    try {
      final homeData = await getHomePageLoadedUseCase(Object());

      homeData?.fold(
          (failure) =>
              {emit(LoadingState()), emit(const ErrorState(message: 'Error'))},
          (success) => {
                emit(LoadingState()),
                emit(HomePageLoaded(
                    carouselImages: success.carouselImagesModel.images,
                    homeMenuModel: success.homeMenusModel)),
              });
    } catch (e) {
      emit(const ErrorState(message: 'ServerException'));
    }
  }
}
