import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/api_profiles.dart';
import 'tables/authentication_methods.dart';
import 'tables/brands.dart';
import 'tables/capabilities.dart';
import 'tables/user_devices.dart';
import 'tables/drivers.dart';
import 'tables/endpoints.dart';
import 'tables/fingerprints.dart';
import 'tables/firmware_capabilities.dart';
import 'tables/firmware_types.dart';
import 'tables/firmwares.dart';
import 'tables/protocols.dart';
import 'tables/version_rules.dart';

import 'daos/brands_dao.dart';
import 'daos/firmware_types_dao.dart';
import 'seed_data.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Brands,
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
    UserDevices,
  ],
  daos: [
    BrandsDao,
    FirmwareTypesDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  static final AppDatabase instance = AppDatabase();

  // Bump this and add a migration step below whenever you change a table.
  @override
  int get schemaVersion => 9;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          // Seed default initial data on database creation
          await batch((b) {
            b.insertAll(brands, SeedData.initialBrands);
            b.insertAll(firmwareTypes, SeedData.initialFirmwareTypes);
          });
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await m.addColumn(brands, brands.logo);
          }
          if (from < 3) {
            await m.addColumn(brands, brands.dns);
          }
          if (from < 5) {
            await m.deleteTable('devices');
            await m.createTable(userDevices);
          }
          if (from < 6) {
            await m.deleteTable('router_models');
          }
          if (from < 7) {
            await m.deleteTable('firmwares');
            await m.createTable(firmwares);
          }
          if (from < 8) {
            await m.deleteTable('drivers');
            await m.createTable(drivers);
          }
          if (from < 9) {
            await m.deleteTable('fingerprints');
            await m.createTable(fingerprints);
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');

          // Fallback seeding: If database already existed before seeding was introduced
          final brandsCountExp = brands.id.count();
          final brandsCount = await (selectOnly(brands)..addColumns([brandsCountExp]))
              .map((row) => row.read(brandsCountExp))
              .getSingle();
          if (brandsCount == 0) {
            await batch((b) {
              b.insertAll(brands, SeedData.initialBrands);
            });
          }

          final fwTypesCountExp = firmwareTypes.id.count();
          final fwTypesCount = await (selectOnly(firmwareTypes)..addColumns([fwTypesCountExp]))
              .map((row) => row.read(fwTypesCountExp))
              .getSingle();
          if (fwTypesCount == 0) {
            await batch((b) {
              b.insertAll(firmwareTypes, SeedData.initialFirmwareTypes);
            });
          }
        },
      );

  Future<void> debugDatabase() async {
    debugPrint('=== START DRIFT DATABASE DEBUG ===');
    
    // Ensure the database is opened by executing a simple query
    await customSelect('SELECT 1').get();

    final dbList = await customSelect('PRAGMA database_list').get();
    debugPrint('Database List:');
    for (final row in dbList) {
      debugPrint(row.data.toString());
    }

    final tables = await customSelect(
      "SELECT name FROM sqlite_master WHERE type='table'",
    ).get();
    debugPrint('Tables:');
    for (final table in tables) {
      debugPrint(table.data.toString());
    }
    
    debugPrint('=== END DRIFT DATABASE DEBUG ===');
  }
}

// Uses drift_flutter's cross-platform helper: picks the right native
// SQLite implementation on Android/iOS/desktop and IndexedDB on web.
QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'router_hub_db',
  );
}
