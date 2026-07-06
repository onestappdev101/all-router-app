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
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await m.addColumn(brands, brands.logo);
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
          final tpLinkBrand = await (select(brands)..where((t) => t.slug.equals('tp-link'))).getSingleOrNull();
          if (tpLinkBrand != null) {
            await (delete(routerModels)..where((t) => t.brandId.equals(tpLinkBrand.id).not())).go();
            if (tpLinkBrand.logo == null) {
              await (update(brands)..where((t) => t.slug.equals('tp-link'))).write(
                const BrandsCompanion(logo: Value('assets/logos/tp_link_logo.webp')),
              );
            }
          }
          final existingBrands = await select(brands).get();
          if (existingBrands.isEmpty) {
            final brandIds = <String, int>{};
            
            final seedBrands = [
              (name: 'TP-Link', website: 'https://www.tp-link.com', logo: 'assets/logos/tp_link_logo.webp', notes: 'Chinese networking equipment manufacturer founded in 1996. Produces Wi-Fi routers, mesh Wi-Fi systems (Deco), range extenders, switches, access points, modems, network adapters, smart home devices (Tapo and Kasa), and enterprise networking solutions under Omada.'),
              (name: 'Netgear', website: 'https://www.netgear.com', logo: null, notes: 'American computer networking company based in San Jose, California. Known for Nighthawk gaming routers, Orbi mesh systems, and Netgear Armor security.'),
              (name: 'Asus', website: 'https://www.asus.com', logo: null, notes: 'Taiwanese multinational computer hardware and electronics company. Popular for RT-series routers, ROG gaming routers, and AiMesh technology.'),
              (name: 'Linksys', website: 'https://www.linksys.com', logo: null, notes: 'American brand of data networking hardware products mainly for home and small business users. Famous for WRT-series routers.'),
              (name: 'D-Link', website: 'https://www.d-link.com', logo: null, notes: 'Taiwanese multinational corporation that designs, manufactures, and markets networking solutions for consumers and businesses.'),
              (name: 'Xiaomi', website: 'https://www.mi.com', logo: null, notes: 'Chinese designer and manufacturer of consumer electronics and smart home products, known for value-focused routers.'),
              (name: 'Huawei', website: 'https://www.huawei.com', logo: null, notes: 'Chinese multinational technology corporation specializing in telecommunications equipment and smart devices.'),
              (name: 'Mikrotik', website: 'https://www.mikrotik.com', logo: null, notes: 'Latvian network equipment manufacturer known for RouterOS and powerful RouterBOARD hardware.'),
            ];

            for (final brand in seedBrands) {
              final id = await into(brands).insert(
                BrandsCompanion.insert(
                  name: brand.name,
                  slug: brand.name.toLowerCase().replaceAll(' ', '-'),
                  website: Value(brand.website),
                  logo: Value(brand.logo),
                  notes: Value(brand.notes),
                ),
              );
              brandIds[brand.name] = id;
            }

            final brandModels = {
              'TP-Link': [
                'TL-WR841HP', 'Archer C58HP', 'TL-WR941HP', 'Archer AX55', 'Archer AX90',
                'Archer AX6000', 'Archer AX50', 'Archer C4000', 'Archer AX15', 'Archer AX10',
                'AD7200', 'Archer A9', 'Archer A6', 'Archer A5', 'Archer C5400X',
                'Archer C6U', 'Archer C80', 'Archer C54', 'Archer C5400', 'Archer C24',
                'Archer GX90', 'Archer AX73', 'Archer AX72', 'Archer AX53', 'Archer AX23',
                'Archer AX20', 'Archer AX12', 'TL-WR820N', 'TL-WR844N', 'Archer C3200',
                'Archer C3150', 'Archer C2300', 'Touch P5', 'Archer C86', 'Archer C9',
                'Archer C8', 'Archer C2600', 'Archer C7', 'Archer C6', 'Archer C64',
                'Archer C60', 'Archer C5 V4', 'Archer C1200', 'Archer C50', 'Archer C2',
                'Archer C20', 'TL-WDR4300', 'TL-WDR3600', 'TL-WDR3500', 'TL-WR1043ND',
                'TL-WR940N', 'TL-WR1042ND', 'TL-WR945N', 'TL-WR941ND', 'TL-WR845N',
                'TL-WR842ND', 'TL-WR841ND', 'TL-WR841N', 'TL-WR840N', 'TL-WR741ND',
                'TL-WR740N', 'TL-WR720N', 'TL-WR802N', 'TL-WR710N', 'TL-WR702N',
                'TL-WR843ND', 'TL-WR743ND', 'TL-R860', 'TL-R460', 'TL-R402M'
              ],
            };

            for (final entry in brandModels.entries) {
              final brandName = entry.key;
              final modelsList = entry.value;
              final bId = brandIds[brandName];
              if (bId != null) {
                for (final modelName in modelsList) {
                  await into(routerModels).insert(
                    RouterModelsCompanion.insert(
                      brandId: bId,
                      name: modelName,
                      modelNumber: modelName,
                    ),
                  );
                }
              }
            }

            // Seed FirmwareTypes
            final seedFirmwareTypes = [
              'Stock',
              'OpenWrt',
              'DD-WRT',
              'Asuswrt-Merlin',
              'Tomato',
              'Padavan',
              'Other / Custom Build',
            ];
            for (final typeName in seedFirmwareTypes) {
              await into(firmwareTypes).insert(
                FirmwareTypesCompanion.insert(name: typeName),
              );
            }
          }
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
