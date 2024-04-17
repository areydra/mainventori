import 'dart:io';

import 'package:csv/csv.dart';
import 'package:drift/drift.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/database/index.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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

  int quantity = 0;
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

      quantity += int.tryParse(value[4].toString()) ?? 0;
    }
  }

  final database = AppDatabase();

  await database.batch((batch) {
    batch.insertAll(database.products, products);
    database.salesSummaryDao.addCurrentSalesSummaryQuantity(quantity);
  }).then((_) async {
    SmartDialog.dismiss();
  }).catchError((error) async {
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

  database.close();
}

void exportDataToExcel() async {
  SmartDialog.showLoading();

  final database = AppDatabase();

  try {
    List<Product> products = await database.productsDao.getAllItems();
    int rowIndex = 1;

    var excel = Excel.createExcel();
    Sheet sheetObject = excel[excel.getDefaultSheet()!];

    CellStyle cellStyle =
        CellStyle(backgroundColorHex: '#448DF2', fontColorHex: '#FFFFFF');
    List<Data> column = [
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)),
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0)),
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0)),
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 0)),
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 0)),
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 0)),
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 0)),
    ];
    column[0].value = const TextCellValue('Kode Produk');
    column[0].cellStyle = cellStyle;
    column[1].value = const TextCellValue('Nama Produk');
    column[1].cellStyle = cellStyle;
    column[2].value = const TextCellValue('Harga Beli');
    column[2].cellStyle = cellStyle;
    column[3].value = const TextCellValue('Jumlah Stok');
    column[3].cellStyle = cellStyle;
    column[4].value = const TextCellValue('Min Stok');
    column[4].cellStyle = cellStyle;
    column[5].value = const TextCellValue('Tanggal Masuk');
    column[5].cellStyle = cellStyle;
    column[6].value = const TextCellValue('Ketersediaan');
    column[6].cellStyle = cellStyle;

    for (int index = 0; index < products.length; index++) {
      List<Data> column = [
        sheetObject.cell(
            CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: rowIndex)),
        sheetObject.cell(
            CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: rowIndex)),
        sheetObject.cell(
            CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: rowIndex)),
        sheetObject.cell(
            CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: rowIndex)),
        sheetObject.cell(
            CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: rowIndex)),
        sheetObject.cell(
            CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: rowIndex)),
        sheetObject.cell(
            CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: rowIndex)),
      ];

      column[0].value = TextCellValue(products[index].code);
      column[1].value = TextCellValue(products[index].name);
      column[2].value = TextCellValue(products[index].buyingPrice.toString());
      column[3].value = TextCellValue(products[index].quantity.toString());
      column[4].value = TextCellValue(products[index].minStock.toString());
      column[5].value = TextCellValue(
          DateFormat('dd MMMM yyyy').format(products[index].dateIn));
      column[6].value = TextCellValue(products[index].quantity == 0
          ? 'Habis'
          : products[index].quantity <= products[index].minStock
              ? 'Menipis'
              : 'Tersedia');

      rowIndex++;
    }

    var fileBytes = excel.save();
    final Directory? downloadsDir = await getDownloadsDirectory();

    String savedFileName = '';

    if (downloadsDir != null) {
      int suffix = 1;
      String baseFileName = 'List_Produk.xlsx';
      String filePath = join(downloadsDir.path, baseFileName);
      File file = File(filePath);

      while (await file.exists()) {
        // If the file already exists, increment the suffix and try again
        filePath = join(downloadsDir.path,
            '${baseFileName.replaceAll('.xlsx', '')}_$suffix.xlsx');
        file = File(filePath);
        suffix++;
      }
      savedFileName =
          file.path.toString().split(Platform.pathSeparator).last.toString();

      // Create and write to the file
      await file.create(recursive: true);
      await file.writeAsBytes(fileBytes!);
    }

    SmartDialog.dismiss();
    SmartDialog.showToast(
      'Data telah disimpan dalam folder Downloads dengan nama file $savedFileName',
      displayTime: const Duration(seconds: 3),
    );
  } catch (e) {
    SmartDialog.dismiss();
    SmartDialog.showToast('Terjadi kesalahan saat menyiapkan data.');
  }

  database.close();
}

class OverallProducts {
  late int totalProducts;
  late int totalLowProducts;

  OverallProducts({
    required this.totalProducts,
    required this.totalLowProducts,
  });
}

Future<OverallProducts> getOverallProducts() async {
  final database = AppDatabase();

  try {
    List<Product> products = await database.productsDao.getAllItems();
    List<Product> lowStockProducts =
        await database.productsDao.getAllLowStockItems();

    database.close();

    return OverallProducts(
      totalProducts: products.length,
      totalLowProducts: lowStockProducts.length,
    );
  } catch (e) {
    database.close();
    rethrow;
  }
}
