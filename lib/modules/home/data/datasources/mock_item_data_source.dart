import 'package:framework_test/core/common/models/item_model.dart';

const data = [
  {'name': 'Maçã', 'type': 1, 'price': 2.50},
  {'name': 'Abacaxi', 'type': 2, 'price': 2.50},
  {'name': 'Banana', 'type': 3, 'price': 2.50},
  {'name': 'Manga', 'type': 4, 'price': 2.50},
  {'name': 'Pêra', 'type': 5, 'price': 2.50},
];

class MockItemDataSource {
  Future<Iterable<ItemModel>> getItems() async {
    return Future.value(ItemModel.fromJsonList(data));
  }
}
