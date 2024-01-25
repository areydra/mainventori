import 'package:drift/drift.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get expiryDate => text()();
  TextColumn get unit => text()();
  IntColumn get buyingPrice => integer()();
  IntColumn get quantity => integer()();
  IntColumn get thresholdVlue => integer()();
}
