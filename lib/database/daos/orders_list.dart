import 'package:drift/drift.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/database/tables/orders_list.dart';

class DaosOrdersListGetItems {
  late List<OrdersListData> ordersList;

  DaosOrdersListGetItems({
    required this.ordersList,
  });
}

@DriftAccessor(tables: [OrdersList])
class OrdersListDao extends DatabaseAccessor<AppDatabase> {
  final AppDatabase appDatabase;

  OrdersListDao(this.appDatabase) : super(appDatabase);

  Future<DaosOrdersListGetItems> getItems(int idOrders, [String? query]) async {
    List<OrdersListData> fetchOrders = await (appDatabase
            .select(appDatabase.ordersList)
          ..where((column) {
            return column.idOrders.equals(idOrders);
          })
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc)]))
        .get();

    return Future.value(DaosOrdersListGetItems(
      ordersList: fetchOrders,
    ));
  }
}
