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
  sl.registerFactory(() => LoginCubit(loginUseCase: sl(), loginRequest: sl()));

  //Use Cases

  sl.registerLazySingleton(() => LoginUseCase(loginRepostiory: sl()));

  //Repository

  sl.registerLazySingleton<LoginRepostiory>(
      () => LoginRepositoryImpl(loginDatasource: sl()));

  //data source

  sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl());
}
