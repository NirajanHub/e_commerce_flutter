import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/login/domain/entities/login_response_entity.dart';

import '../../../../core/error/failure.dart';

abstract class LoginRepostiory {
  Future<Either<Failure, LoginResponse>>? login();
}
