import 'package:drift/drift.dart';

class OrdersList extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idOrders => integer()();
  TextColumn get productCode => text()();
  TextColumn get productName => text()();
  IntColumn get originalPrice => integer()();
  IntColumn get sellingPrice => integer()();
  IntColumn get quantity => integer()();
  DateTimeColumn get createdAt => dateTime()();
}
