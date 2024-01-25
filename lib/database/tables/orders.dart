import 'package:drift/drift.dart';

class Orders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get expectedDelivery => text()();
  TextColumn get unit => text()();
  IntColumn get orderValue => integer()();
  IntColumn get quantity => integer()();
  IntColumn get orderId => integer()();
}
