import 'package:equatable/equatable.dart';
import 'package:framework_test/core/internacionalization/i10n_converter.dart';

enum ItemModelType { apple, pineapple, banana, mango, pear }

extension ItemModelExt on ItemModelType {
  static fromInt(int value) {
    switch (value) {
      case 1:
        return ItemModelType.apple;
      case 2:
        return ItemModelType.pineapple;
      case 3:
        return ItemModelType.banana;
      case 4:
        return ItemModelType.mango;
      case 5:
        return ItemModelType.pear;
    }
  }

  String get icon {
    switch (this) {
      case ItemModelType.apple:
        return 'assets/maca.png';
      case ItemModelType.pineapple:
        return 'assets/pineapple.png';
      case ItemModelType.pear:
        return 'assets/pear.png';
      case ItemModelType.banana:
        return 'assets/banana.png';
      case ItemModelType.mango:
        return 'assets/manga.png';
    }
  }
}

class ItemModel extends Equatable {
  const ItemModel({
    required this.name,
    required this.type,
    required this.price,
  });

  final String name;
  final ItemModelType type;
  final double price;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type.index,
      'price': price,
    };
  }

  factory ItemModel.fromJson(Map<String, dynamic> map) {
    return ItemModel(
      name: I10nConverter.converter[map['name']] ?? '',
      type: ItemModelExt.fromInt(map['type']),
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  static Iterable<ItemModel> fromJsonList(Iterable list) => list.isEmpty
      ? []
      : list.map(
          (item) => ItemModel.fromJson(item),
        );

  @override
  List<Object?> get props => [name, type, price];
}
