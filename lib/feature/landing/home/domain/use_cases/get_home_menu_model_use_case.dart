import 'package:e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/feature/landing/home/data/models/home_menus_model.dart';
import 'package:e_commerce/feature/landing/home/domain/repositories/home_repository.dart';

class GetHomeMenuModelUseCase extends UseCase<List<HomeMenusModel>, void> {
  final HomeRepository homeRepository;

  GetHomeMenuModelUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<HomeMenusModel>>>? call(void params) async {
    final homeMenuModelData = await homeRepository.getHomeMenuModel();
    return homeMenuModelData;
  }
}
