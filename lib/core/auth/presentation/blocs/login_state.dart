part of 'login_bloc.dart';

abstract class LoginState {}

class LoginIdleState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailedState extends LoginState {}
