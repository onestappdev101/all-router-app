import 'package:drift/drift.dart';

class Capabilities extends Table {
  IntColumn get id => integer().autoIncrement()();
  // wifi, guest_wifi, wan, dhcp, qos, vpn, mesh, reboot
  TextColumn get key => text().unique()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
}
