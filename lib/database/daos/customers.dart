import 'package:drift/drift.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/database/tables/customers.dart';

@DriftAccessor(tables: [Customers])
class CustomersDao extends DatabaseAccessor<AppDatabase> {
  final AppDatabase appDatabase;

  CustomersDao(this.appDatabase) : super(appDatabase);

  Future<List<Customer>> getItemsPerPage(
      {int limitPerPage = 50, int pageNumber = 0, String query = ''}) async {
    try {
      return await (appDatabase.select(appDatabase.customers)
            ..where((column) {
              return column.name.contains(query) |
                  column.contactNumber.contains(query) |
                  column.email.contains(query);
            })
            ..orderBy([
              (t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)
            ])
            ..limit(limitPerPage, offset: pageNumber * limitPerPage))
          .get();
    } catch (e) {
      rethrow;
    }
  }
}
