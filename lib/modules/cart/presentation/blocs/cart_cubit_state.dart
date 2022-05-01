import 'package:framework_test/core/models/item_model.dart';

class CartItem {
  final ItemModel item;
  final int quantity;

  CartItem({
    required this.item,
    required this.quantity,
  });

  CartItem copyWith({
    ItemModel? item,
    int? quantity,
  }) {
    return CartItem(
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartCubitState {
  final Map<String, CartItem> items;

  CartCubitState({
    required this.items,
  });

  factory CartCubitState.empty() => CartCubitState(items: {});

  CartCubitState copyWith({
    Map<String, CartItem>? items,
  }) {
    return CartCubitState(
      items: items ?? this.items,
    );
  }
}
