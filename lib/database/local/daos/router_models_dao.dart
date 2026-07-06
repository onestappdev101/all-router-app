import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/router_models.dart';

import '../tables/brands.dart';

part 'router_models_dao.g.dart';

@DriftAccessor(tables: [RouterModels, Brands])
class RouterModelsDao extends DatabaseAccessor<AppDatabase> with _$RouterModelsDaoMixin {
  RouterModelsDao(super.db);

  Stream<List<RouterModel>> watchModelsForBrand(int brandId) {
    return (select(routerModels)..where((t) => t.brandId.equals(brandId))).watch();
  }

  Stream<List<RouterModel>> watchModelsForBrandSlug(String slug) {
    final query = select(routerModels).join([
      innerJoin(brands, brands.id.equalsExp(routerModels.brandId)),
    ])..where(brands.slug.equals(slug));
    
    return query.map((row) => row.readTable(routerModels)).watch();
  }
}
