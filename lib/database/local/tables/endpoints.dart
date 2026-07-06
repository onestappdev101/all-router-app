import 'package:drift/drift.dart';

import 'api_profiles.dart';

@TableIndex(name: 'idx_endpoints_api_profile', columns: {#apiProfileId})
class Endpoints extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get apiProfileId => integer().references(ApiProfiles, #id)();
  // Authentication, WAN, LAN, Wireless, DHCP, Firewall, Clients, QoS, VPN
  TextColumn get category => text()();
  TextColumn get operation => text()();
  TextColumn get httpMethod => text().nullable()();
  TextColumn get path => text()();
  BoolColumn get requiresAuth =>
      boolean().withDefault(const Constant(true))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
