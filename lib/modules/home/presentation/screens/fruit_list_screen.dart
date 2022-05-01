import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework_test/core/models/item_model.dart';
import 'package:framework_test/modules/cart/presentation/blocs/cart_cubit.dart';
import 'package:framework_test/modules/home/presentation/blocs/item_bloc.dart';
import 'package:framework_test/modules/home/presentation/widgets/cart_fab.dart';
import 'package:framework_test/modules/home/presentation/widgets/item_widget.dart';
import 'package:framework_test/modules/home/presentation/widgets/search_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FruiListScreen extends StatefulWidget {
  const FruiListScreen({Key? key}) : super(key: key);

  @override
  State<FruiListScreen> createState() => _FruiListScreenState();
}

class _FruiListScreenState extends State<FruiListScreen> {
  late final ItemCubit itemCubit;
  late final CartCubit cartCubit;

  @override
  void initState() {
    super.initState();
    itemCubit = BlocProvider.of<ItemCubit>(context)..getItems();
    cartCubit = BlocProvider.of<CartCubit>(context);
  }

  List<ItemModel> selectedItems = [];

  void onSelectItem(ItemModel model) {
    if (selectedItems.contains(model)) {
      selectedItems.remove(model);
    } else {
      selectedItems.add(model);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          itemCubit.getItems();
          return Future.value(null);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 200,
              floating: true,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/framework.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BlocBuilder<ItemCubit, ItemBlocState>(
              bloc: itemCubit,
              buildWhen: (_, state) => state is LoadItemsSuccessState,
              builder: (context, state) => state is LoadItemsSuccessState
                  ? SliverPadding(
                      padding: const EdgeInsets.all(18),
                      sliver: SliverToBoxAdapter(
                        child: SearchField(
                          onChangeText: (value) =>
                              itemCubit.filterItems(value ?? ''),
                        ),
                      ),
                    )
                  : const SliverToBoxAdapter(child: SizedBox.shrink()),
            ),
            BlocBuilder<ItemCubit, ItemBlocState>(
              bloc: itemCubit,
              builder: (context, state) {
                if (state is LoadingItemsState) {
                  return const SliverToBoxAdapter(
                    child: LinearProgressIndicator(
                      color: Colors.purple,
                    ),
                  );
                }
                if (state is! LoadItemsSuccessState) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.itemsNotFound,
                          style: const TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                final items = state.filteredItems;
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ItemWidget(
                        item: items.elementAt(index),
                        isSelected:
                            selectedItems.contains(items.elementAt(index)),
                        onPress: onSelectItem,
                      );
                    },
                    childCount: items.length,
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: CartFab(
        selectedItems: selectedItems,
        onPress: () {
          FocusScope.of(context).unfocus();
          cartCubit.setCartItems(selectedItems);
        },
      ),
    );
  }
}
