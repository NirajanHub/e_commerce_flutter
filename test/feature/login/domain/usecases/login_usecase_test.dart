import 'package:dartz/dartz.dart';
import 'package:e_commerce/feature/login/data/models/login_model.dart';
import 'package:e_commerce/feature/login/domain/repository/login_repository.dart';
import 'package:e_commerce/feature/login/domain/usecases/login_usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLoginRepository extends Mock implements LoginRepostiory {}

void main() {
  late MockLoginRepository mockLoginRepository;
  late LoginUseCase usecase;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    usecase = LoginUseCase(mockLoginRepository);
  });

  const tLoginResponse = LoginResponseModel(
      accessToken: 'accessToken', refreshToken: 'refreshToken');

  test('should call login repository', () async {
    //arrange
    when(mockLoginRepository.login())
        .thenAnswer((_) async => const Right(tLoginResponse));
    //act
    // final result =
        await usecase(const LoginRequest(email: 'email', password: 'password'));
    //assert
    //  expect(result, tLoginResponse);
    verify(mockLoginRepository.login());
    verifyNoMoreInteractions(mockLoginRepository);
  });
}
