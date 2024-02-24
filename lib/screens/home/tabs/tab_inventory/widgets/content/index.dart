import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/header.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/products_list_content.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/footer.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/products_list_header.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ContentInventory extends StatefulWidget {
  const ContentInventory({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContentInventoryState createState() => _ContentInventoryState();
}

class _ContentInventoryState extends State<ContentInventory> {
  final database = AppDatabase();
  List<Product> products = [];
  int currentPageNumber = 0;
  int totalPageNumber = 0;
  int limitPerPage = 10;
  String searchQuery = '';

  Future<void> getItemsPerPage(int pageNumber, String query) async {
    List<Product> fetchedProducts = await (database.select(database.products)
          ..where((column) {
            return column.code.contains(query) |
                column.name.contains(query) |
                column.buyingPrice.cast<String>().contains(query) |
                column.quantity.cast<String>().contains(query) |
                column.minStock.cast<String>().contains(query);
          })
          ..orderBy([
            (t) => drift.OrderingTerm(
                expression: t.id, mode: drift.OrderingMode.desc)
          ])
          ..limit(limitPerPage, offset: pageNumber * limitPerPage))
        .get();

    setState(() {
      products = fetchedProducts;
      currentPageNumber = pageNumber;
    });
  }

  getTotalRowCount() async {
    final int count = (await database.products.count().get())[0];

    setState(() {
      totalPageNumber = ((count / limitPerPage).ceil());
    });
  }

  @override
  void initState() {
    super.initState();

    refreshDataProducts();
  }

  void refreshDataProducts() {
    getItemsPerPage(0, searchQuery);
    getTotalRowCount();
  }

  void searchDataProducts(String query) {
    getItemsPerPage(0, query);
    getTotalRowCount();
    setState(() {
      searchQuery = query;
    });
  }

  void exportDataToExcel() async {
    SmartDialog.showLoading();

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

    List<Product> products = await (database.select(database.products)
          ..where((column) {
            return column.code.contains(searchQuery) |
                column.name.contains(searchQuery) |
                column.buyingPrice.cast<String>().contains(searchQuery) |
                column.quantity.cast<String>().contains(searchQuery) |
                column.minStock.cast<String>().contains(searchQuery);
          })
          ..orderBy([
            (t) => drift.OrderingTerm(
                expression: t.id, mode: drift.OrderingMode.asc)
          ]))
        .get()
        .catchError((error) async {
      SmartDialog.dismiss();
      SmartDialog.showToast('Terjadi kesalahan saat menyiapkan data.');
    });

    int rowIndex = 1;
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
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Header(
            refreshDataProducts: refreshDataProducts,
            searchDataProducts: searchDataProducts,
            exportDataToExcel: exportDataToExcel,
          ),
          const ProductListHeader(),
          ProductsListContent(
            products: products,
            refreshDataProducts: refreshDataProducts,
          ),
          Footer(
              currentPage: currentPageNumber,
              totalPage: totalPageNumber,
              onPressNextPage: () {
                if ((currentPageNumber + 1) < totalPageNumber) {
                  getItemsPerPage(currentPageNumber + 1, searchQuery);
                }
              },
              onPressPreviousPage: () {
                if (currentPageNumber > 0) {
                  getItemsPerPage(currentPageNumber - 1, searchQuery);
                }
              }),
        ],
      ),
    ));
  }
}
