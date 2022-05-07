import 'package:framework_test/core/common/models/item_model.dart';

abstract class IItemRepository {
  Future<Iterable<ItemModel>> getItems();
}
