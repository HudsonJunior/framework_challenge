import 'package:flutter_test/flutter_test.dart';
import 'package:framework_test/core/common/models/item_model.dart';

void main() {
  test('When converting from int should return the correct value', () {
    expect(ItemModelExt.fromInt(1), ItemModelType.apple);
    expect(ItemModelExt.fromInt(2), ItemModelType.pineapple);
    expect(ItemModelExt.fromInt(3), ItemModelType.banana);
    expect(ItemModelExt.fromInt(4), ItemModelType.mango);
    expect(ItemModelExt.fromInt(5), ItemModelType.pear);
  });

  test('When getting the icon should return the correct value', () {
    expect(ItemModelType.apple.icon, 'assets/maca.png');
    expect(ItemModelType.pear.icon, 'assets/pear.png');
    expect(ItemModelType.pineapple.icon, 'assets/pineapple.png');
    expect(ItemModelType.banana.icon, 'assets/banana.png');
    expect(ItemModelType.mango.icon, 'assets/manga.png');
  });
}
