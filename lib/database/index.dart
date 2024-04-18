import 'dart:io';

import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:mainventori/database/daos/customers.dart';
import 'package:mainventori/database/daos/orders.dart';
import 'package:mainventori/database/daos/orders_list.dart';
import 'package:mainventori/database/daos/products.dart';
import 'package:mainventori/database/daos/sales_summary.dart';
import 'package:mainventori/database/daos/suppliers.dart';
import 'package:mainventori/database/daos/top_selling_stock.dart';
import 'package:mainventori/database/tables/sales_summary.dart';
import 'package:mainventori/database/tables/top_selling_stock.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'package:mainventori/database/tables/customers.dart';
import 'package:mainventori/database/tables/orders.dart';
import 'package:mainventori/database/tables/products.dart';
import 'package:mainventori/database/tables/suppliers.dart';
import 'package:mainventori/database/tables/orders_list.dart';

part 'index.g.dart';

@DriftDatabase(tables: [
  Customers,
  Orders,
  Products,
  Suppliers,
  OrdersList,
  SalesSummary,
  TopSellingStock
], daos: [
  ProductsDao,
  OrdersDao,
  OrdersListDao,
  SalesSummaryDao,
  TopSellingStockDao,
  SuppliersDao,
  CustomersDao,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
