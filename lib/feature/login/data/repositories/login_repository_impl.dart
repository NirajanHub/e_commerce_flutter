import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/feature/login/data/data_source/login_datasource.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/login/domain/entities/login_response_entity.dart';
import 'package:e_commerce/feature/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepostiory {
  final LoginDataSource loginDatasource;
  LoginRepositoryImpl({required this.loginDatasource});

  @override
  Future<Either<Failure, LoginResponse>>? login() async {
    try {
      final loginResponse = await loginDatasource.getLoginInformation();
      return Right(loginResponse!);
    } on ServerException {
      return const Left(ServerFailure());
    } on CacheException {
      return const Left(CacheFailure());
    }
  }
}
