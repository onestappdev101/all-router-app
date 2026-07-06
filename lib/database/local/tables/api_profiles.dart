import 'package:drift/drift.dart';

import 'authentication_methods.dart';
import 'drivers.dart';
import 'protocols.dart';

class ApiProfiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  // "TP-Link JSON API v2", "OpenWrt LuCI", "MikroTik RouterOS API"
  TextColumn get name => text()();
  IntColumn get protocolId => integer().references(Protocols, #id)();
  IntColumn get authenticationId =>
      integer().references(AuthenticationMethods, #id)();

  TextColumn get transport => text().nullable()();
  IntColumn get defaultPort => integer().nullable()();
  TextColumn get baseUrl => text().nullable()();
  TextColumn get basePath => text().nullable()();
  TextColumn get loginEndpoint => text().nullable()();
  TextColumn get logoutEndpoint => text().nullable()();

  BoolColumn get csrfEnabled =>
      boolean().withDefault(const Constant(false))();
  TextColumn get cookieName => text().nullable()();
  TextColumn get sessionHeader => text().nullable()();

  // fallback driver used if no version_rule matches
  IntColumn get defaultDriverId =>
      integer().nullable().references(Drivers, #id)();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
