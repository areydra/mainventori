import 'package:drift/drift.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/database/tables/suppliers.dart';

@DriftAccessor(tables: [Suppliers])
class SuppliersDao extends DatabaseAccessor<AppDatabase> {
  final AppDatabase appDatabase;

  SuppliersDao(this.appDatabase) : super(appDatabase);

  Future<List<Supplier>> getItemsPerPage(
      {int limitPerPage = 50, int pageNumber = 0, String query = ''}) async {
    try {
      return await (appDatabase.select(appDatabase.suppliers)
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
