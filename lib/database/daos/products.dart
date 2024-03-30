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

@DriftAccessor(tables: [Products])
class ProductsDao extends DatabaseAccessor<AppDatabase> {
  final AppDatabase appDatabase;

  ProductsDao(this.appDatabase) : super(appDatabase);

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

  Future<DaosGetItemsPerPage> searchDataProducts(
      int limitPerPage, String query) async {
    return Future.value(await getItemsPerPage(0, limitPerPage, query));
  }
}
