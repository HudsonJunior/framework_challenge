import 'package:flutter/material.dart';
import 'package:framework_test/core/common/models/item_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:framework_test/core/resources/extensions.dart';

class ItemWidget extends StatelessWidget {
  final ItemModel item;
  final bool isSelected;
  final ValueSetter<ItemModel> onPress;

  const ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.onPress,
  }) : super(key: key);

  Color get selectedBorderColor =>
      isSelected ? Colors.purple : Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(item),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: selectedBorderColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: item.type.icon + item.type.name,
                  child: Image.asset(item.type.icon),
                ),
                flex: 2,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        '${item.name} - R\$ ${item.price.toString().priceFormatted}',
                        style: const TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 15,
                            width: 15,
                            child: Checkbox(
                              side: const BorderSide(
                                color: Colors.purple,
                                width: 2,
                              ),
                              activeColor: Colors.purple,
                              shape: const CircleBorder(),
                              value: isSelected,
                              onChanged: (_) {
                                onPress(item);
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            isSelected
                                ? AppLocalizations.of(context)!.selected
                                : AppLocalizations.of(context)!.select,
                            style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
