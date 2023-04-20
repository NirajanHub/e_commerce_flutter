import 'package:e_commerce/feature/login/domain/entities/login_response_entity.dart';
import 'package:e_commerce/feature/login/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase})
      : super(InitialState());

  void login(LoginRequest loginRequest) async {
    try {
      final loginCase = await loginUseCase(loginRequest);
      loginCase?.fold((failure) {
        emit(LoadingState());
        emit(const ErrorState(message: 'ServerFailure'));
      }, (login) {
        emit(LoadingState());
        emit(AuthState(login: login));
      });
    } catch (e) {
      emit(const ErrorState(message: 'ServerException'));
    }
  }
}
