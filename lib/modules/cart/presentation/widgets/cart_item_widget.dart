import 'package:flutter/material.dart';

import 'package:framework_test/core/models/item_model.dart';
import 'package:framework_test/core/resources/extensions.dart';
import 'package:framework_test/modules/cart/presentation/blocs/cart_cubit_state.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const CartItemWidget({
    Key? key,
    required this.item,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: item.item.type.icon + item.item.type.name,
                child: Image.asset(
                  item.item.type.icon,
                  width: 40,
                  height: 40,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(item.item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      'Qtd: ${item.quantity.toString()}',
                      style: const TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: onRemove,
                      icon: const Icon(
                        Icons.remove_circle_rounded,
                        color: Colors.purple,
                      ),
                    ),
                    IconButton(
                      onPressed: onAdd,
                      icon: const Icon(
                        Icons.add_circle_rounded,
                        color: Colors.purple,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  'R\$ ${(item.item.price * item.quantity).toString().priceFormatted}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
