import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/brands.dart';

part 'brands_dao.g.dart';

@DriftAccessor(tables: [Brands])
class BrandsDao extends DatabaseAccessor<AppDatabase> with _$BrandsDaoMixin {
  BrandsDao(super.db);

  Stream<List<Brand>> watchAllBrands() => select(brands).watch();
  Future<List<Brand>> getAllBrands() => select(brands).get();
  Future<Brand?> getBrandByName(String name) =>
      (select(brands)..where((t) => t.name.equals(name))).getSingleOrNull();
}
