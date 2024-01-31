import 'package:drift/drift.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  TextColumn get supplier => text()();
  IntColumn get buyingPrice => integer()();
  IntColumn get quantity => integer()();
  TextColumn get unit => text()();
  TextColumn get expiryDate => text()();
  IntColumn get thresholdValue => integer()();
}
