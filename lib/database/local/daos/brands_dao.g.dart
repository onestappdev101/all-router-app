// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brands_dao.dart';

// ignore_for_file: type=lint
mixin _$BrandsDaoMixin on DatabaseAccessor<AppDatabase> {
  $BrandsTable get brands => attachedDatabase.brands;
  BrandsDaoManager get managers => BrandsDaoManager(this);
}

class BrandsDaoManager {
  final _$BrandsDaoMixin _db;
  BrandsDaoManager(this._db);
  $$BrandsTableTableManager get brands =>
      $$BrandsTableTableManager(_db.attachedDatabase, _db.brands);
}
