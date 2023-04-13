import 'package:e_commerce/feature/login/data/data_source/login_datasource.dart';
import 'package:e_commerce/feature/login/domain/entities/login_request_entity.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepostiory {
  final LoginDatasource loginDatasource;
LoginRepositoryImpl({required this.loginDatasource});

  @override
  Future<Either<Failure, LoginRequestEntity>>? login() async {
      return await loginDatasource.getLoginInformation();
  }
}
