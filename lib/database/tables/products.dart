import 'package:drift/drift.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text().unique()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  TextColumn get supplier => text()();
  IntColumn get buyingPrice => integer()();
  IntColumn get quantity => integer()();
  TextColumn get unit => text()();
  DateTimeColumn get dateIn => dateTime()();
  IntColumn get minStock => integer()();
}
