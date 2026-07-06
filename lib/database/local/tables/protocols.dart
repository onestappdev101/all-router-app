import 'package:drift/drift.dart';

class Protocols extends Table {
  IntColumn get id => integer().autoIncrement()();
  // HTTP, HTTPS, SOAP, JSON-RPC, SSH, Telnet, WebSocket
  TextColumn get name => text().unique()();
  TextColumn get description => text().nullable()();
}
