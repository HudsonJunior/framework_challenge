import 'package:framework_test/modules/cart/presentation/blocs/cart_cubit_state.dart';

extension StringExt on String {
  String get priceFormatted => padRight(4, '0').replaceAll('.', ',');
}

extension TotalValueExt on Iterable<CartItem> {
  double get totalValue => fold<double>(
      0,
      (previousValue, element) =>
          previousValue + (element.quantity * element.item.price));
}
