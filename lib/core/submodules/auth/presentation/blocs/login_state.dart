part of 'login_bloc.dart';

abstract class LoginState {}

class LoginIdleState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  GoogleSignInAccount user;

  LoginSuccessState({
    required this.user,
  });
}

class LoginFailedState extends LoginState {}
