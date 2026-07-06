import 'package:drift/drift.dart';

import 'fingerprints.dart';
import 'firmwares.dart';
import 'router_models.dart';

class Devices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get routerModelId =>
      integer().nullable().references(RouterModels, #id)();
  IntColumn get firmwareId =>
      integer().nullable().references(Firmwares, #id)();
  TextColumn get ipAddress => text()();
  TextColumn get macAddress => text().nullable()();
  TextColumn get alias => text().nullable()();
  TextColumn get credentialsEncrypted => text().nullable()();
  IntColumn get lastFingerprintId =>
      integer().nullable().references(Fingerprints, #id)();
  BoolColumn get isVerified =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get lastSeenAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
