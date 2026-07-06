import 'package:drift/drift.dart';

import 'brands.dart';

class RouterModels extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get brandId => integer().references(Brands, #id)();
  TextColumn get name => text()();
  TextColumn get modelNumber => text()();
  TextColumn get hardwareVersion => text().nullable()();
  IntColumn get releaseYear => integer().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {brandId, modelNumber},
      ];
}
