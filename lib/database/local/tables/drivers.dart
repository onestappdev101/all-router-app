import 'package:drift/drift.dart';

class Drivers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get driverClass => text()();
  TextColumn get notes => text().nullable()();
}

