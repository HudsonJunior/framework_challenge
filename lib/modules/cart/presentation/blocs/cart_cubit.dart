import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework_test/core/models/item_model.dart';
import 'package:framework_test/modules/cart/presentation/blocs/cart_cubit_state.dart';

class CartCubit extends Cubit<CartCubitState> {
  CartCubit() : super(CartCubitState.empty());

  void setCartItems(Iterable<ItemModel> items) {
    final map = <String, CartItem>{};

    for (var item in items) {
      map.addAll({item.name: CartItem(item: item, quantity: 1)});
    }

    emit(CartCubitState(items: map));
  }

  void resetCart() {
    emit(CartCubitState.empty());
  }

  void updateItem(ItemModel item, int quantity) {
    if (quantity == 0) {
      return emit(
        CartCubitState(
          items: state.items..removeWhere((key, value) => value.item == item),
        ),
      );
    }

    var newItems = state.items;

    newItems[item.name] = CartItem(item: item, quantity: quantity);

    emit(
      CartCubitState(
        items: newItems,
      ),
    );
  }
}
