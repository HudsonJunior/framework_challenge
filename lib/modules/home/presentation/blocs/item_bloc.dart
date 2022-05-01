import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework_test/core/models/item_model.dart';

import 'package:framework_test/modules/home/domain/usecases/item_usecase.dart';

part 'item_bloc_state.dart';

class ItemCubit extends Cubit<ItemBlocState> {
  ItemCubit(
    this.itemUsecase,
  ) : super(IdleItemsState());

  final ItemUsecase itemUsecase;

  void getItems() async {
    emit(LoadingItemsState());
    final response = await itemUsecase.getItems();

    // Just for UI loading
    await Future.delayed(const Duration(seconds: 2));
    emit(LoadItemsSuccessState(items: response, filteredItems: response));
  }

  void filterItems(String filter) {
    if (state is! LoadItemsSuccessState) return;

    final _state = (state as LoadItemsSuccessState);

    if (filter.isEmpty) {
      return emit(
        LoadItemsSuccessState(items: _state.items, filteredItems: _state.items),
      );
    }

    final items = (state as LoadItemsSuccessState).items.where(
          (item) => item.name.toUpperCase().contains(
                filter.toUpperCase(),
              ),
        );
    emit(
      LoadItemsSuccessState(
          filteredItems: items, items: (state as LoadItemsSuccessState).items),
    );
  }
}
