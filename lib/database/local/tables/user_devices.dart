import 'package:drift/drift.dart';

import 'fingerprints.dart';
import 'firmwares.dart';
import 'brands.dart';

class UserDevices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get brandId => integer().references(Brands, #id)();
  TextColumn get routerModel=> text().nullable()();
  TextColumn get dns => text().nullable()();
  IntColumn get endpointId => integer().nullable()();
  DateTimeColumn get lastSeenAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
