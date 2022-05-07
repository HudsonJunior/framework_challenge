import 'package:framework_test/modules/cart/presentation/blocs/cart_cubit_state.dart';

abstract class IPdfManager {
  Future<void> writePdf(Map<String, CartItem> items);
}
