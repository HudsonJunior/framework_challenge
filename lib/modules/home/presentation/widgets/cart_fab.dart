import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:framework_test/core/models/item_model.dart';

import 'package:framework_test/modules/cart/presentation/screens/cart_screen.dart';

class CartFab extends StatelessWidget {
  const CartFab({
    Key? key,
    required this.selectedItems,
    required this.onPress,
  }) : super(key: key);

  final List<ItemModel> selectedItems;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          if (selectedItems.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(context)!.addItemsToBag,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.purple,
              ),
            );
            return;
          }
          onPress();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const CartScreen(),
            ),
          );
        },
        child: Badge(
          badgeColor: Colors.white,
          elevation: 6,
          badgeContent: Text(
            '${selectedItems.length}',
            style: const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Icon(Icons.shopping_cart_rounded),
        ),
      ),
    );
  }
}
