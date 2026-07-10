import 'package:drift/drift.dart';

import 'firmwares.dart';
import 'brands.dart';

@TableIndex(name: 'idx_fingerprints_brand', columns: {#brandId})
@TableIndex(name: 'idx_fingerprints_firmware', columns: {#firmwareId})
@TableIndex(name: 'idx_fingerprints_match_type', columns: {#matchType})
class Fingerprints extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get brandId =>
      integer().nullable().references(Brands, #id)();
  IntColumn get firmwareId =>
      integer().nullable().references(Firmwares, #id)();
  // title, favicon_hash, cookie, server, header, html, redirect, api_response
  TextColumn get matchType => text()();
  TextColumn get matchValue => text()();
  IntColumn get priority => integer().withDefault(const Constant(0))();
  // 0-100, how strong this signal is on its own
  IntColumn get confidence => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
