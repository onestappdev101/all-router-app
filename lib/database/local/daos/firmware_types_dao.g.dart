// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firmware_types_dao.dart';

// ignore_for_file: type=lint
mixin _$FirmwareTypesDaoMixin on DatabaseAccessor<AppDatabase> {
  $FirmwareTypesTable get firmwareTypes => attachedDatabase.firmwareTypes;
  FirmwareTypesDaoManager get managers => FirmwareTypesDaoManager(this);
}

class FirmwareTypesDaoManager {
  final _$FirmwareTypesDaoMixin _db;
  FirmwareTypesDaoManager(this._db);
  $$FirmwareTypesTableTableManager get firmwareTypes =>
      $$FirmwareTypesTableTableManager(_db.attachedDatabase, _db.firmwareTypes);
}
