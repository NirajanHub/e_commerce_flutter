import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/feature/landing/home/domain/use_cases/get_carousel_image_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCarouselImagesUseCase getCarouselUseCase;
  HomeCubit({required this.getCarouselUseCase}) : super(HomeInitial());

  void getCarouselImages() async {
    try {
      final images = await getCarouselUseCase(Object());
      images.fold(
          (failure) => {
                emit(CarouselImagesLoading()),
                emit(const ErrorState(message: 'Error'))
              },
          (success) => {
                emit(CarouselImagesLoading()),
                emit(CarouselImagesLoaded(carouselImages: success)),
              });
    } catch (e) {
      emit(const ErrorState(message: 'ServerException'));
    }
  }
}
