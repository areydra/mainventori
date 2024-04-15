import 'package:drift/drift.dart';

class TopSellingStock extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idProduct => integer()();
  IntColumn get quantitySold => integer()();
  TextColumn get month => text()();
  TextColumn get year => text()();
}
