import 'package:drift/drift.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/database/tables/products.dart';

class DaosGetItemsPerPage {
  late List<Product> products;
  late int currentPageNumber;

  DaosGetItemsPerPage({
    required this.products,
    required this.currentPageNumber,
  });
}

class DaosSearchDataProducts {
  late List<Product> products;
  late int currentPageNumber;
  late int totalPageNumber;

  DaosSearchDataProducts({
    required this.products,
    required this.currentPageNumber,
    required this.totalPageNumber,
  });
}

@DriftAccessor(tables: [Products])
class ProductsDao extends DatabaseAccessor<AppDatabase> {
  final AppDatabase appDatabase;

  ProductsDao(this.appDatabase) : super(appDatabase);

  Future<List<Product>> getAllItems({String query = ''}) async {
    try {
      return await (appDatabase.select(appDatabase.products)
            ..where((column) {
              return column.code.contains(query) |
                  column.name.contains(query) |
                  column.buyingPrice.cast<String>().contains(query) |
                  column.quantity.cast<String>().contains(query) |
                  column.minStock.cast<String>().contains(query);
            })
            ..orderBy([
              (t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc)
            ]))
          .get();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Product>> getAllLowStockItems() async {
    try {
      return await (appDatabase.select(appDatabase.products)
            ..where((column) {
              return column.quantity.isSmallerOrEqual(column.minStock) &
                  column.quantity.isBiggerThanValue(0);
            }))
          .get();
    } catch (e) {
      rethrow;
    }
  }

  Future<DaosGetItemsPerPage> getItemsPerPage(int pageNumber, int limitPerPage,
      [String? query]) async {
    List<Product> fetchedProducts = await (appDatabase
            .select(appDatabase.products)
          ..where((column) {
            String querySearch = query ?? '';

            return column.code.contains(querySearch) |
                column.name.contains(querySearch) |
                column.buyingPrice.cast<String>().contains(querySearch) |
                column.quantity.cast<String>().contains(querySearch) |
                column.minStock.cast<String>().contains(querySearch);
          })
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
          ..limit(limitPerPage, offset: pageNumber * limitPerPage))
        .get();

    return Future.value(DaosGetItemsPerPage(
      products: fetchedProducts,
      currentPageNumber: pageNumber,
    ));
  }

  Future<int> getTotalRowCount(int limitPerPage, [String? query]) async {
    int count = await (appDatabase.select(appDatabase.products)
          ..where((column) {
            String querySearch = query ?? '';

            return column.code.contains(querySearch) |
                column.name.contains(querySearch) |
                column.buyingPrice.cast<String>().contains(querySearch) |
                column.quantity.cast<String>().contains(querySearch) |
                column.minStock.cast<String>().contains(querySearch);
          }))
        .get()
        .then((List<Product> fetchedProducts) => fetchedProducts.length);

    return Future.value((count / limitPerPage).ceil());
  }

  Future<DaosSearchDataProducts> searchDataProducts(
      int limitPerPage, String query) async {
    try {
      DaosGetItemsPerPage productsPerPage =
          await getItemsPerPage(0, limitPerPage, query);
      int totalPageNumber = await getTotalRowCount(limitPerPage, query);

      return Future.value(DaosSearchDataProducts(
        products: productsPerPage.products,
        currentPageNumber: productsPerPage.currentPageNumber,
        totalPageNumber: totalPageNumber,
      ));
    } catch (e) {
      return Future.error(e);
    }
  }
}
