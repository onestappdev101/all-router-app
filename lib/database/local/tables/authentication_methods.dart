import 'package:drift/drift.dart';

class AuthenticationMethods extends Table {
  IntColumn get id => integer().autoIncrement()();
  // Basic Auth, Digest Auth, Cookie Session, JWT, RSA Login
  TextColumn get name => text().unique()();
  TextColumn get passwordEncoding => text().nullable()();
  BoolColumn get requiresNonce =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get requiresCsrf =>
      boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
}
