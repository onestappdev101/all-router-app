import 'package:drift/drift.dart';

class Brands extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get website => text().nullable()();
  TextColumn get logo => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get dns => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
