import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exceptions.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/feature/login/data/data_source/login_datasource.dart';
import 'package:e_commerce/feature/login/data/models/login_model.dart';
import 'package:e_commerce/feature/login/data/repositories/login_repository_impl.dart';
import 'package:e_commerce/feature/login/domain/repository/login_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginDataSource extends Mock implements LoginDataSource {}

void main() {
  late MockLoginDataSource mockLoginDataSource;
  late LoginRepostiory loginRepostiory;
  setUp(() {
    mockLoginDataSource = MockLoginDataSource();
    loginRepostiory = LoginRepositoryImpl(loginDatasource: mockLoginDataSource);
  });

  group(
    'loginUser',
    () {
      const tLoginResponse = LoginResponseModel(
          accessToken: 'accessToken', refreshToken: 'refreshToken');
      test('should return login response when all data are passed correctly',
          () async {
        //arrange
        when(mockLoginDataSource.getLoginInformation())
            .thenAnswer((_) async => tLoginResponse);
        //act
        final result = await loginRepostiory.login();
        //assert
        expect(result, const Right(tLoginResponse));
      });

      test(
        'should return server failure when there is server exception',
        () async {
          //arrange
          when(mockLoginDataSource.getLoginInformation())
              .thenThrow(ServerException());
          //act
          final result = await loginRepostiory.login();
          //assert
          verify(mockLoginDataSource.getLoginInformation());
          expect(result, const Left(ServerFailure()));
        },
      );
    },
  );
}
