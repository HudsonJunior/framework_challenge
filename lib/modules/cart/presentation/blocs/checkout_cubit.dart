import 'package:bloc/bloc.dart';
import 'package:framework_test/modules/cart/presentation/blocs/cart_cubit_state.dart';

import 'package:framework_test/modules/cart/usecases/checkout_usecase.dart';

part 'checkout_cubit_state.dart';

class CheckoutCubit extends Cubit<CheckoutCubitState> {
  CheckoutCubit(
    this.checkoutUseCase,
  ) : super(CheckoutIdleState());

  final CheckoutUseCase checkoutUseCase;

  void saveCheckoutAsPdf(Map<String, CartItem> items) async {
    emit(CheckoutLoadingState());

    final response = await checkoutUseCase.saveCheckoutAsPdf(items);

    if (!response) return emit(CheckoutFailedState());

    emit(CheckoutSuccessState());
  }
}
