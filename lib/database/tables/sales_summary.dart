import 'package:drift/drift.dart';

class SalesSummary extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get revenue => integer()();
  IntColumn get cost => integer()();
  IntColumn get quantityInHand => integer()();
  IntColumn get quantitySold => integer()();
  TextColumn get month => text()();
  TextColumn get year => text()();
}
