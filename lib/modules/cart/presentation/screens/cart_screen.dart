import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework_test/core/common/presentation/widgets/snackbar.dart';
import 'package:framework_test/modules/cart/presentation/blocs/cart_cubit.dart';
import 'package:framework_test/modules/cart/presentation/blocs/cart_cubit_state.dart';
import 'package:framework_test/modules/cart/presentation/blocs/checkout_cubit.dart';
import 'package:framework_test/modules/cart/presentation/widgets/cart_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:framework_test/core/resources/extensions.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final CartCubit cartCubit;
  late final CheckoutCubit checkoutCubit;

  @override
  void initState() {
    super.initState();
    cartCubit = BlocProvider.of<CartCubit>(context);
    checkoutCubit = BlocProvider.of<CheckoutCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverToBoxAdapter(
                child: Text(
                  AppLocalizations.of(context)!.selectedItems,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            BlocBuilder<CartCubit, CartCubitState>(
              bloc: cartCubit,
              builder: (context, state) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = state.items.values.elementAt(index);
                      return CartItemWidget(
                        item: item,
                        onAdd: () {
                          cartCubit.updateItem(item.item, item.quantity + 1);
                        },
                        onRemove: () {
                          cartCubit.updateItem(item.item, item.quantity - 1);
                        },
                      );
                    },
                    childCount: state.items.length,
                  ),
                );
              },
            ),
            BlocBuilder<CartCubit, CartCubitState>(
              bloc: cartCubit,
              builder: (context, state) {
                return SliverPadding(
                  padding: const EdgeInsets.only(top: 16),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        '${AppLocalizations.of(context)!.totalValue}: R\$: ${state.items.values.totalValue.toString().priceFormatted}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(12),
                    height: 70,
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        checkoutCubit.saveCheckoutAsPdf(cartCubit.state.items);
                        cartCubit.resetCart();
                      },
                      child: BlocConsumer<CheckoutCubit, CheckoutCubitState>(
                          listener: (context, state) {
                            if (state is CheckoutFailedState) {
                              CustomSnackBar(
                                title: AppLocalizations.of(context)!
                                    .checkoutFailed,
                                backgroundColor: Colors.red,
                              ).show(context);
                            }

                            if (state is CheckoutSuccessState) {
                              Navigator.of(context).pop();

                              CustomSnackBar(
                                title: AppLocalizations.of(context)!
                                    .checkoutSuccess,
                                backgroundColor: Colors.green,
                              ).show(context);
                            }
                          },
                          bloc: checkoutCubit,
                          builder: (context, state) {
                            if (state is CheckoutLoadingState) {
                              return const CircularProgressIndicator(
                                color: Colors.white,
                              );
                            }

                            return const Text(
                              "Checkout",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
