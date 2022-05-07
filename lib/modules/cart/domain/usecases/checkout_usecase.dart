import 'package:framework_test/modules/cart/data/pdf_manager.dart';
import 'package:framework_test/modules/cart/domain/interfaces/ipdf_manager.dart';
import 'package:framework_test/modules/cart/presentation/blocs/cart_cubit_state.dart';

class CheckoutUseCase {
  CheckoutUseCase({
    required this.pdfManager,
  });

  final IPdfManager pdfManager;

  Future<bool> saveCheckoutAsPdf(Map<String, CartItem> items) async {
    try {
      await pdfManager.writePdf(items);
      return true;
    } on PdfErrorException {
      return false;
    } on Exception {
      return false;
    }
  }
}
