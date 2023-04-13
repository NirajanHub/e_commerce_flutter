import 'dart:convert';

import 'package:e_commerce/feature/login/domain/entities/login_request_entity.dart';
import 'package:e_commerce/feature/login/domain/entities/login_response_entity.dart';

class LoginRequestModel extends LoginRequestEntity {
  const LoginRequestModel({required super.email, required super.password});

  LoginRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) =>
      LoginRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

class LoginResponseModel extends LoginResponse{

  const LoginResponseModel({required super.accessToken, required super.refreshToken});

}
