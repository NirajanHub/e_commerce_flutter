import 'package:e_commerce/feature/login/domain/entities/login_response_entity.dart';

abstract class LoginDataSource {
  Future<LoginResponse?>? getLoginInformation();
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<LoginResponse?>? getLoginInformation() {
    return Future.value(
        const LoginResponse(accessToken: 'abc', refreshToken: 'def'));
  }
}
