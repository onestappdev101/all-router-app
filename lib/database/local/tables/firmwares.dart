import 'package:drift/drift.dart';

import 'api_profiles.dart';
import 'firmware_types.dart';
import 'router_models.dart';

@TableIndex(name: 'idx_firmwares_version_sort', columns: {#versionSort})
class Firmwares extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get routerModelId => integer().references(RouterModels, #id)();
  IntColumn get firmwareTypeId => integer().references(FirmwareTypes, #id)();
  IntColumn get apiProfileId => integer().references(ApiProfiles, #id)();

  TextColumn get version => text()(); // display string, e.g. "23.05.2"
  IntColumn get versionMajor => integer().nullable()();
  IntColumn get versionMinor => integer().nullable()();
  IntColumn get versionPatch => integer().nullable()();
  // major*1_000_000 + minor*1_000 + patch, for range queries
  IntColumn get versionSort => integer().nullable()();

  TextColumn get buildNumber => text().nullable()();
  DateTimeColumn get releaseDate => dateTime().nullable()();
  BoolColumn get isBeta => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {routerModelId, firmwareTypeId, version, buildNumber},
      ];
}
