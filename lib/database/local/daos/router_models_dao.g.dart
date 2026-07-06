// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_models_dao.dart';

// ignore_for_file: type=lint
mixin _$RouterModelsDaoMixin on DatabaseAccessor<AppDatabase> {
  $BrandsTable get brands => attachedDatabase.brands;
  $RouterModelsTable get routerModels => attachedDatabase.routerModels;
  RouterModelsDaoManager get managers => RouterModelsDaoManager(this);
}

class RouterModelsDaoManager {
  final _$RouterModelsDaoMixin _db;
  RouterModelsDaoManager(this._db);
  $$BrandsTableTableManager get brands =>
      $$BrandsTableTableManager(_db.attachedDatabase, _db.brands);
  $$RouterModelsTableTableManager get routerModels =>
      $$RouterModelsTableTableManager(_db.attachedDatabase, _db.routerModels);
}
