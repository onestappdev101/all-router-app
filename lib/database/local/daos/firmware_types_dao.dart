import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/firmware_types.dart';

part 'firmware_types_dao.g.dart';

@DriftAccessor(tables: [FirmwareTypes])
class FirmwareTypesDao extends DatabaseAccessor<AppDatabase> with _$FirmwareTypesDaoMixin {
  FirmwareTypesDao(super.db);

  Stream<List<FirmwareType>> watchCustomFirmwares() {
    return (select(firmwareTypes)..where((t) => t.name.equals('Stock').not())).watch();
  }
}
