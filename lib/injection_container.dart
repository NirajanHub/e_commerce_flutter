import 'package:e_commerce/feature/landing/home/data/data_source/home_data_source.dart';
import 'package:e_commerce/feature/landing/home/data/repositories/home_repository_impl.dart';
import 'package:e_commerce/feature/landing/home/domain/repositories/home_repository.dart';
import 'package:e_commerce/feature/landing/home/domain/use_cases/get_carousel_image_use_case.dart';
import 'package:e_commerce/feature/landing/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:e_commerce/feature/login/data/data_source/login_datasource.dart';
import 'package:e_commerce/feature/login/data/repositories/login_repository_impl.dart';
import 'package:e_commerce/feature/login/domain/repository/login_repository.dart';
import 'package:e_commerce/feature/login/domain/usecases/login_usecase.dart';
import 'package:e_commerce/feature/login/presentation/bloc/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.asNewInstance();
Future<void> init() async {
  //!Features - Number Trivia

//Bloc
  sl.registerFactory(() => LoginCubit(loginUseCase: sl()));

  //Use Cases
  sl.registerLazySingleton(() => LoginUseCase(loginRepostiory: sl()));

  //Repository
  sl.registerLazySingleton<LoginRepostiory>(
      () => LoginRepositoryImpl(loginDatasource: sl()));

  //data source
  sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());

  //!Features - Home Trivia

//Bloc
  sl.registerFactory(() => HomeCubit(getCarouselUseCase: sl()));

  //Use Cases
  sl.registerLazySingleton(
      () => GetCarouselImagesUseCase(homeRepository: sl()));

  //Repository
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: sl()));

  //data source
  sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());
}
