part of 'item_bloc.dart';

abstract class ItemBlocState {}

class LoadingItemsState extends ItemBlocState {}

class IdleItemsState extends ItemBlocState {}

class LoadItemsSuccessState extends ItemBlocState {
  final Iterable<ItemModel> items;
  final Iterable<ItemModel> filteredItems;

  LoadItemsSuccessState({
    required this.items,
    required this.filteredItems,
  });
}

class LoadItemsFailedState extends ItemBlocState {}
