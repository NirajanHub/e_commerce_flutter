import 'package:e_commerce/feature/login/data/data_source/login_datasource.dart';
import 'package:e_commerce/feature/login/data/models/login_model.dart';
import 'package:e_commerce/fixtures/fixture_reader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LoginDataSource loginDataSource;
  setUp(() => {loginDataSource = LoginDataSourceImpl()});
  test('should return LoginResponse Model', () async {
    //act
    final result = await loginDataSource.getLoginInformation();

    //assert
    expect(result,
        LoginResponseModel.fromJson(fixture('fake_login_response.json')));
  });
}
