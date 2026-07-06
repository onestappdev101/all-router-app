import 'package:drift/drift.dart';

import 'api_profiles.dart';
import 'drivers.dart';

@TableIndex(
  name: 'idx_version_rules_lookup',
  columns: {#apiProfileId, #minVersionSort, #maxVersionSort},
)
class VersionRules extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apiProfileId => integer().references(ApiProfiles, #id)();
  IntColumn get minVersionSort => integer()();
  IntColumn get maxVersionSort => integer()();
  IntColumn get driverId => integer().references(Drivers, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
