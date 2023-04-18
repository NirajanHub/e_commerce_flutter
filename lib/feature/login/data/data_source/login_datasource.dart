import 'package:e_commerce/feature/login/data/models/login_model.dart';
import 'package:e_commerce/feature/login/domain/entities/login_response_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

abstract class LoginDataSource {
  Future<LoginResponse?>? getLoginInformation();
}

class LoginDataSourceImpl implements LoginDataSource{
  
  @override
  Future<LoginResponse?>? getLoginInformation() {
    return Future.value(LoginResponseModel.fromJson(fixture('fake_login_response.json')));
    }

}
