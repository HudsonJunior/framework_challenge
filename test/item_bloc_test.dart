import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framework_test/core/models/item_model.dart';
import 'package:framework_test/modules/home/domain/usecases/item_usecase.dart';
import 'package:framework_test/modules/home/presentation/blocs/item_bloc.dart';
import 'package:mocktail/mocktail.dart';

class ItemUseCaseMock extends Mock implements ItemUsecase {}

void main() {
  late ItemCubit itemCubit;
  late ItemUseCaseMock itemUseCaseMock;
  final itemModelList = [
    const ItemModel(name: 'Banana', type: ItemModelType.banana, price: 2.50),
    const ItemModel(name: 'Maçã', type: ItemModelType.apple, price: 2.50),
    const ItemModel(
        name: 'Abacaxi', type: ItemModelType.pineapple, price: 2.50),
  ];

  setUp(() {
    itemUseCaseMock = ItemUseCaseMock();
    itemCubit = ItemCubit(itemUseCaseMock);
  });

  test('When getting items should return SuccessState', () {});

  blocTest(
    'When getting items should return SuccessState',
    build: () => itemCubit,
    act: (ItemCubit cubit) {
      when(itemUseCaseMock.getItems).thenAnswer(
        (_) async => await Future.value(itemModelList),
      );

      itemCubit.getItems();
    },
    expect: () => [
      isA<LoadingItemsState>(),
      isA<LoadItemsSuccessState>().having(
        (state) => state.items,
        'value',
        itemModelList,
      )
    ],
  );

  blocTest(
    'When filtering items should filter successful',
    build: () {
      when(itemUseCaseMock.getItems).thenAnswer(
        (_) async => await Future.value(itemModelList),
      );

      itemCubit.getItems();
      return itemCubit;
    },
    act: (ItemCubit cubit) async {
      itemCubit.filterItems('Banana');
    },
    expect: () => [
      isA<LoadItemsSuccessState>().having(
        (state) => state.items.elementAt(0),
        'value',
        itemModelList[0],
      )
    ],
  );
}
