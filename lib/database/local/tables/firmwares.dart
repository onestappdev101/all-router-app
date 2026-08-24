import 'package:drift/drift.dart';

import 'api_profiles.dart';
import 'firmware_types.dart';
import 'brands.dart';

class Firmwares extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get brandId => integer().references(Brands, #id)();
  IntColumn get firmwareTypeId => integer().references(FirmwareTypes, #id)();
  IntColumn get apiProfileId => integer().references(ApiProfiles, #id)();
  TextColumn get version => text()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {brandId, firmwareTypeId, version},
      ];
}

