import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/feature/landing/home/domain/repositories/home_repository.dart';

import '../../../../../core/error/failure.dart';

class GetCarouselImagesUseCase extends UseCase<List<String>, void> {
  final HomeRepository homeRepository;

  GetCarouselImagesUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<String>>> call(void params) async {
    final value = await homeRepository.getCarouselImages();
    return value;
  }
}
