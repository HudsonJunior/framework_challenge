part of 'checkout_cubit.dart';

abstract class CheckoutCubitState {}

class CheckoutIdleState extends CheckoutCubitState {}

class CheckoutFailedState extends CheckoutCubitState {}

class CheckoutLoadingState extends CheckoutCubitState {}

class CheckoutSuccessState extends CheckoutCubitState {}
