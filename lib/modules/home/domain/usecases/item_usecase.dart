import 'package:framework_test/core/common/models/item_model.dart';
import 'package:framework_test/modules/home/domain/interfaces/item_repository_interface.dart';

class ItemUsecase {
  final IItemRepository itemRepository;

  ItemUsecase({
    required this.itemRepository,
  });

  Future<Iterable<ItemModel>> getItems() async => itemRepository.getItems();
}
