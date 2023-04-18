import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/login/domain/entities/login_response_entity.dart';
import 'package:e_commerce/feature/login/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final LoginRequest loginRequest;
  LoginCubit({required this.loginUseCase, required this.loginRequest})
      : super(InitialState()) {
    login();
  }

  void login() async {
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
