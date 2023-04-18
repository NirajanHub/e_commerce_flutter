import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/login/domain/entities/login_response_entity.dart';
import 'package:e_commerce/feature/login/domain/repository/login_repository.dart';
import 'package:e_commerce/feature/login/domain/usecases/login_usecase.dart';
import 'package:e_commerce/feature/login/presentation/bloc/cubit/login_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockLoginRepository extends Mock implements LoginRepostiory {}

void main() {
  late LoginCubit loginCubit;
  //late LoginRepostiory loginRepostiory;
  late MockLoginUseCase mockLoginUseCase;
  late LoginRequest loginRequest;
  setUp(() {
    loginRequest = const LoginRequest(email: 'email', password: 'password');
    //loginRepostiory = MockLoginRepository();
    mockLoginUseCase = MockLoginUseCase();
    loginCubit =
        LoginCubit(loginUseCase: mockLoginUseCase, loginRequest: loginRequest);
  });

  group('login user with right credential , should return Loading Loaded', () {
    const tloginResponse =
        LoginResponse(accessToken: 'accessToken', refreshToken: 'refreshToken');

    test(
      'returns loding and AuthState loaded',
      () async {
        //arrange
        when(mockLoginUseCase(any))
            .thenAnswer((_) async => const Right(tloginResponse));

        //assert later
        final expected = [
          LoadingState(),
          const AuthState(login: tloginResponse)
        ];
        expectLater(loginCubit.stream, emitsInOrder(expected));

        //act
        loginCubit.login();
      },
    );

    test(
      'returns failure when server exception is thrown. The error is catched',
      () async {
        //arrange
        when(mockLoginUseCase(any)).thenThrow(ServerException());
        //assert later
        final expected = [const ErrorState(message: 'ServerException')];
        expectLater(loginCubit.stream, emitsInOrder(expected));
        //act
        loginCubit.login();
      },
    );
    test(
      'returns failure when server exception is thrown. The error is from Left',
      () async {
        //arrange
        when(mockLoginUseCase(any))
            .thenAnswer((realInvocation) async => const Left(ServerFailure()));
        //assert later
        final expected = [
          LoadingState(),
          const ErrorState(message: 'ServerFailure')
        ];
        expectLater(loginCubit.stream, emitsInOrder(expected));
        //act
        loginCubit.login();
      },
    );
  });
}
