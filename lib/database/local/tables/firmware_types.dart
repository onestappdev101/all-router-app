import 'package:drift/drift.dart';

class FirmwareTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Stock, OpenWrt, DD-WRT, Tomato, Merlin, Padavan, Gargoyle...
  TextColumn get name => text().unique()();
}
