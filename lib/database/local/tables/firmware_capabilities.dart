import 'package:drift/drift.dart';

import 'capabilities.dart';
import 'firmwares.dart';

class FirmwareCapabilities extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get firmwareId => integer().references(Firmwares, #id)();
  IntColumn get capabilityId => integer().references(Capabilities, #id)();
  BoolColumn get supported => boolean().withDefault(const Constant(true))();

  @override
  List<Set<Column>> get uniqueKeys => [
        {firmwareId, capabilityId},
      ];
}
