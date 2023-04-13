// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class LoginRequestEntity extends Equatable {
  final String email;
  final String password;
  const LoginRequestEntity({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}
