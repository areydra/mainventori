import 'package:drift/drift.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/database/tables/orders.dart';

class DaosGetItemsPerPage {
  late List<Order> orders;
  late int currentPageNumber;

  DaosGetItemsPerPage({
    required this.orders,
    required this.currentPageNumber,
  });
}

@DriftAccessor(tables: [Orders])
class OrdersDao extends DatabaseAccessor<AppDatabase> {
  final AppDatabase appDatabase;

  OrdersDao(this.appDatabase) : super(appDatabase);

  Future<DaosGetItemsPerPage> getItemsPerPage(int pageNumber, int limitPerPage,
      [String? query]) async {
    List<Order> fetchOrders = await (appDatabase.select(appDatabase.orders)
          ..where((column) {
            String querySearch = query ?? '';

            return column.customer.contains(querySearch) |
                column.productName.contains(querySearch);
          })
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)])
          ..limit(limitPerPage, offset: pageNumber * limitPerPage))
        .get();

    return Future.value(DaosGetItemsPerPage(
      orders: fetchOrders,
      currentPageNumber: pageNumber,
    ));
  }

  Future<int> getTotalRowCount(int limitPerPage, [String? query]) async {
    int count = await (appDatabase.select(appDatabase.orders)
          ..where((column) {
            String querySearch = query ?? '';

            return column.customer.contains(querySearch) |
                column.productName.contains(querySearch);
          }))
        .get()
        .then((List<Order> fetchOrders) => fetchOrders.length);

    return Future.value((count / limitPerPage).ceil());
  }

  Future<DaosGetItemsPerPage> searchDataOrders(
      int limitPerPage, String query) async {
    return Future.value(await getItemsPerPage(0, limitPerPage, query));
  }
}
