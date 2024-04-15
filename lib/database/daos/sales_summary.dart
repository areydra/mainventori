import 'package:drift/drift.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/database/tables/sales_summary.dart';
import 'package:mainventori/utils/times.dart';

class DaosSalesSummaryGetItems {
  late List<OrdersListData> ordersList;

  DaosSalesSummaryGetItems({
    required this.ordersList,
  });
}

@DriftAccessor(tables: [SalesSummary])
class SalesSummaryDao extends DatabaseAccessor<AppDatabase> {
  final AppDatabase appDatabase;

  SalesSummaryDao(this.appDatabase) : super(appDatabase);

  Future<SalesSummaryData> getCurrentSalesSummary() async {
    List<SalesSummaryData> queryResult =
        await (appDatabase.select(appDatabase.salesSummary)
              ..where((column) {
                return column.month.equals(getCurrentDate().month) &
                    column.year.equals(getCurrentDate().year);
              })
              ..limit(1, offset: 0))
            .get();

    return Future.value(queryResult.isNotEmpty
        ? queryResult[0]
        : const SalesSummaryData(
            id: 0,
            revenue: 0,
            cost: 0,
            quantityInHand: 0,
            quantitySold: 0,
            month: '',
            year: ''));
  }

  Future<SalesSummaryData> setCurrentSalesSummary(SalesSummaryData data) async {
    try {
      SalesSummaryData currentSalesSummaryData = await getCurrentSalesSummary();
      SalesSummaryCompanion newSalesSummaryData = SalesSummaryCompanion.insert(
        revenue: currentSalesSummaryData.revenue + data.revenue,
        cost: currentSalesSummaryData.cost + data.cost,
        quantityInHand:
            currentSalesSummaryData.quantityInHand - data.quantitySold,
        quantitySold: currentSalesSummaryData.quantitySold + data.quantitySold,
        month: data.month,
        year: data.year,
      );

      if (currentSalesSummaryData.id == 0) {
        appDatabase.into(appDatabase.salesSummary).insert(newSalesSummaryData);
      } else {
        appDatabase.update(appDatabase.salesSummary)
          ..where((column) =>
              column.month.equals(getCurrentDate().month) &
              column.year.equals(getCurrentDate().year))
          ..write(newSalesSummaryData);
      }

      return Future.value(SalesSummaryData(
        id: int.parse(currentSalesSummaryData.id.toString()),
        revenue: int.parse(newSalesSummaryData.revenue.toString()),
        cost: int.parse(newSalesSummaryData.cost.toString()),
        quantityInHand:
            int.parse(newSalesSummaryData.quantityInHand.toString()),
        quantitySold: int.parse(newSalesSummaryData.quantitySold.toString()),
        month: newSalesSummaryData.month.toString(),
        year: newSalesSummaryData.year.toString(),
      ));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<int> addCurrentSalesSummaryQuantity(int quantity) async {
    try {
      SalesSummaryData currentSalesSummaryData = await getCurrentSalesSummary();
      CurrentDate currentDate = getCurrentDate();

      if (currentSalesSummaryData.id == 0) {
        appDatabase
            .into(appDatabase.salesSummary)
            .insert(SalesSummaryCompanion.insert(
              revenue: 0,
              cost: 0,
              quantityInHand: quantity,
              quantitySold: 0,
              month: currentDate.month,
              year: currentDate.year,
            ));
      } else {
        appDatabase.update(appDatabase.salesSummary)
          ..where((column) =>
              column.month.equals(getCurrentDate().month) &
              column.year.equals(getCurrentDate().year))
          ..write(SalesSummaryCompanion(
              quantityInHand:
                  Value(currentSalesSummaryData.quantityInHand + quantity)));
      }

      return Future.value(currentSalesSummaryData.quantityInHand + quantity);
    } catch (e) {
      return Future.error(e);
    }
  }
}
