import 'package:drift/drift.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/database/tables/top_selling_stock.dart';
import 'package:mainventori/utils/times.dart';

class TopSellingStockWithProductDetails {
  late int id;
  late int idProduct;
  late int quantitySold;
  late String month;
  late String year;
  late int price;
  late int quantity;
  late String name;

  TopSellingStockWithProductDetails({
    required this.id,
    required this.idProduct,
    required this.quantitySold,
    required this.month,
    required this.year,
    required this.price,
    required this.quantity,
    required this.name,
  });
}

class DaosTopSellingStockGetItems {
  late List<TopSellingStockWithProductDetails> topSellingStockList;

  DaosTopSellingStockGetItems({
    required this.topSellingStockList,
  });
}

@DriftAccessor(tables: [TopSellingStock])
class TopSellingStockDao extends DatabaseAccessor<AppDatabase> {
  final AppDatabase appDatabase;

  TopSellingStockDao(this.appDatabase) : super(appDatabase);

  Future<DaosTopSellingStockGetItems> getItems() async {
    List<TopSellingStockWithProductDetails> queryResult =
        await (appDatabase.select(appDatabase.topSellingStock).join([
      leftOuterJoin(
          appDatabase.products,
          appDatabase.products.id
              .equalsExp(appDatabase.topSellingStock.idProduct)),
    ])
              ..where(appDatabase.topSellingStock.month
                      .equals(getCurrentDate().month) &
                  appDatabase.topSellingStock.year
                      .equals(getCurrentDate().year))
              ..limit(8, offset: 0)
              ..orderBy([
                OrderingTerm(
                  expression: appDatabase.topSellingStock.quantitySold,
                  mode: OrderingMode.desc,
                )
              ]))
            .map((row) {
      final topSellingStock = row.readTable(appDatabase.topSellingStock);
      final products = row.readTable(appDatabase.products);

      return TopSellingStockWithProductDetails(
        id: topSellingStock.id,
        idProduct: topSellingStock.idProduct,
        quantitySold: topSellingStock.quantitySold,
        month: topSellingStock.month,
        year: topSellingStock.year,
        price: products.buyingPrice,
        quantity: products.quantity,
        name: products.name,
      );
    }).get();

    return Future.value(DaosTopSellingStockGetItems(
      topSellingStockList: queryResult,
    ));
  }

  Future<TopSellingStockData> setItem(TopSellingStockData data) async {
    try {
      int insertedId;
      List<TopSellingStockData> queryResult =
          await (appDatabase.select(appDatabase.topSellingStock)
                ..where((column) =>
                    column.idProduct.equals(data.idProduct) &
                    column.month.equals(getCurrentDate().month) &
                    column.year.equals(getCurrentDate().year))
                ..limit(1, offset: 0))
              .get();
      TopSellingStockCompanion newData = TopSellingStockCompanion.insert(
        idProduct: data.idProduct,
        quantitySold: queryResult.isEmpty
            ? data.quantitySold
            : queryResult[0].quantitySold + data.quantitySold,
        month: data.month,
        year: data.year,
      );

      if (queryResult.isEmpty) {
        insertedId =
            await appDatabase.into(appDatabase.topSellingStock).insert(newData);
      } else {
        insertedId = queryResult[0].id;

        appDatabase.update(appDatabase.topSellingStock)
          ..where((column) => column.idProduct.equals(insertedId))
          ..write(newData);
      }

      return Future.value(TopSellingStockData(
        id: insertedId,
        idProduct: data.idProduct,
        quantitySold: data.quantitySold,
        month: data.month,
        year: data.year,
      ));
    } catch (e) {
      return Future.error(e);
    }
  }
}
