import 'dart:io';

import 'package:framework_test/modules/cart/presentation/blocs/cart_cubit_state.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CheckoutUseCase {
  Future<bool> saveCheckoutAsPdf(Map<String, CartItem> items) async {
    final pdf = pw.Document();

    try {
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.Center(
              child: pw.Column(
                children: items.values
                    .map(
                      (elem) => pw.Text(
                          '${elem.item.name} - Qtd: ${elem.quantity} - R\$: ${elem.item.price}'),
                    )
                    .toList(),
              ),
            );
          },
        ),
      );

      final output = await getApplicationDocumentsDirectory();
      final file = File('${output.path}/checkout.pdf');

      await file.writeAsBytes(await pdf.save());

      return true;
    } on Exception {
      return false;
    }
  }
}
