import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/database/index.dart';

int removePriceCurrency(String value) {
  String priceString = value.replaceAll("Rp", "").replaceAll(".", "");
  return int.tryParse(priceString) ?? 0;
}

Future<void> onPressImportCSV() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['csv'],
    withData: true,
  );

  if (result == null ||
      result.files.isEmpty ||
      result.files.single.bytes == null) {
    return; // Handle the case where no file is picked or the file is empty
  }

  String csvData = String.fromCharCodes(result.files.single.bytes!);
  List<List<dynamic>> rows = const CsvToListConverter().convert(csvData);

  List<ProductsCompanion> products = [];
  DateFormat dateFormat = DateFormat("dd MMMM yyyy");

  SmartDialog.showLoading();

  for (int index = 0; index < rows.length; index++) {
    var value = rows[index];
    var isColumn = value[0].toString().toLowerCase().contains('produk');

    if (isColumn) {
      continue;
    }

    String productCode = '';
    String productName = value[0].toString();
    String productDateIn = value[7].toString();

    if (productName.length > 4) {
      productCode =
          'KP${index.toString() + productName.replaceAll(' ', '').substring(0, 4)}';
    } else {
      productCode = 'KP${index.toString() + productName}';
    }

    if (value.isNotEmpty) {
      DateTime dateIn =
          DateTime.now(); // Default value if productDateIn is empty

      if (productDateIn.isNotEmpty) {
        dateIn = dateFormat.parse(productDateIn);
      }

      products.add(
        ProductsCompanion(
          code: Value(productCode),
          name: Value(productName),
          category: Value(value[1].toString()),
          supplier: Value(value[2].toString()),
          buyingPrice: Value(removePriceCurrency(value[3].toString())),
          quantity: Value(int.tryParse(value[4].toString()) ?? 0),
          minStock: Value(int.tryParse(value[5].toString()) ?? 0),
          unit: Value(value[6].toString()),
          dateIn: Value(dateIn),
        ),
      );
    }
  }

  final database = AppDatabase();

  await database.batch((batch) {
    batch.insertAll(database.products, products);
  }).then((_) async {
    SmartDialog.dismiss();
  }).catchError((error) async {
    print('ERROR: ${error.toString()}');
    SmartDialog.dismiss();
    SmartDialog.show(builder: (context) {
      return Container(
        height: 150,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Pastikan data CSV lengkap!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  });
}
