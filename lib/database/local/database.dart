import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/api_profiles.dart';
import 'tables/authentication_methods.dart';
import 'tables/brands.dart';
import 'tables/capabilities.dart';
import 'tables/devices.dart';
import 'tables/drivers.dart';
import 'tables/endpoints.dart';
import 'tables/fingerprints.dart';
import 'tables/firmware_capabilities.dart';
import 'tables/firmware_types.dart';
import 'tables/firmwares.dart';
import 'tables/protocols.dart';
import 'tables/router_models.dart';
import 'tables/version_rules.dart';

import 'daos/brands_dao.dart';
import 'daos/router_models_dao.dart';
import 'daos/firmware_types_dao.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Brands,
    RouterModels,
    FirmwareTypes,
    Protocols,
    AuthenticationMethods,
    Drivers,
    ApiProfiles,
    Firmwares,
    Endpoints,
    Capabilities,
    FirmwareCapabilities,
    Fingerprints,
    VersionRules,
    Devices,
  ],
  daos: [
    BrandsDao,
    RouterModelsDao,
    FirmwareTypesDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  static final AppDatabase instance = AppDatabase();

  // Bump this and add a migration step below whenever you change a table.
  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await m.addColumn(brands, brands.logo);
          }
          if (from < 3) {
            await m.addColumn(routerModels, routerModels.modelNumber);
            await m.addColumn(brands, brands.dns);
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

// Uses drift_flutter's cross-platform helper: picks the right native
// SQLite implementation on Android/iOS/desktop and IndexedDB on web.
QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'router_hub_db',
  );
}
