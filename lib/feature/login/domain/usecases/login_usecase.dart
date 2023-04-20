// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:e_commerce/core/usecase/usecase.dart';

import '../entities/login_response_entity.dart';
import '../repository/login_repository.dart';

class LoginUseCase extends UseCase<LoginResponse, LoginRequest> {
  final LoginRepostiory loginRepostiory;

  LoginUseCase({required this.loginRepostiory});
  @override
  Future<Either<Failure, LoginResponse>>? call(LoginRequest? params) async {
    
    //   bool isEmailValid = LoginValidation.emailValidation(params!.email);
    //   bool isPasswordValid = LoginValidation.passwordValidation(params.password);
    //   if (isEmailValid && isPasswordValid) {
    //     return await loginRepostiory.login()!;
    //   } else if (!isEmailValid) {
    //     return const Left(FailureWithMessage(message: 'Insert a valid email'));
    //   } else if (!isPasswordValid) {
    //     return const Left(FailureWithMessage(
    //         message:
    //             '''Password should be at least eight characters with one uppercase,
    //             one lowercase and one special character'''));
    //   } else {
    //     return const Left(ServerFailure());
    //   }
    // }

    return await loginRepostiory.login()!;
  }
}

class LoginRequest extends Equatable {
  final String email;
  final String password;
  const LoginRequest({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
