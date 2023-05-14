import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanner {
  scanner() async {
    final result = await FlutterBarcodeScanner.scanBarcode(
            '#ff6666', 'Cancelar', true, ScanMode.BARCODE);

    return result;
  }
}
