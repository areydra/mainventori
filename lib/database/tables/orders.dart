import 'package:drift/drift.dart';

class Orders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get productName => text()();
  IntColumn get productQuantity => integer()();
  IntColumn get productSellingPrice => integer()();
  IntColumn get totalOrdersQuantity => integer()();
  IntColumn get totalOrdersSellingPrice => integer()();
  DateTimeColumn get deliveryDate => dateTime()();
  TextColumn get customer => text()();
  DateTimeColumn get createdAt => dateTime()();
}
