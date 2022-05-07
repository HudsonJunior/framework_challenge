import 'package:framework_test/core/common/models/item_model.dart';
import 'package:framework_test/modules/home/data/datasources/mock_item_data_source.dart';
import 'package:framework_test/modules/home/domain/interfaces/item_repository_interface.dart';

class ItemRepository implements IItemRepository {
  final MockItemDataSource mockItemDataSource;

  ItemRepository({
    required this.mockItemDataSource,
  });

  @override
  Future<Iterable<ItemModel>> getItems() => mockItemDataSource.getItems();
}
