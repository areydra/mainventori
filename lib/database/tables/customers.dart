import 'package:drift/drift.dart';

class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get contactNumber => text()();
  TextColumn get email => text()();
  TextColumn get address => text()();
}
