part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class InitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingState extends LoginState {}

class AuthState extends LoginState {
  const AuthState({required this.login});

  final LoginResponse login;

  @override
  List<Object> get props => [login];
}

class ErrorState extends LoginState {
  const ErrorState({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
